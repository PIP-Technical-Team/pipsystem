# pipsys v1: fixed-format status facts for the PIP packages.
#
# Usage, from the pipsystem root, through the wrapper that keeps temporary
# files on E: (tools/pipsys/pipsys.cmd):
#
#   tools\pipsys\pipsys.cmd status <package>   Repository, Plans, Handoffs, Gaps
#   tools\pipsys\pipsys.cmd overview           one row per package + roadmap
#   tools\pipsys\pipsys.cmd handoffs [project] latest run per project and task
#   tools\pipsys\pipsys.cmd site               regenerate site/gen and render
#   tools\pipsys\pipsys.cmd check-map          check tables/pipeline_map.csv
#   tools\pipsys\pipsys.cmd check-doc <file>   check a /pip-doc document
#   tools\pipsys\pipsys.cmd check-path <path>  exit 1 if a path leaves the checkout
#   tools\pipsys\pipsys.cmd install-kilo       copy tools/pipsys/kilo/* into .kilo/
#
# Packages and paths: tools/pipsys/packages.csv (the pipsystem row always
# means the checkout that holds this script). Quarto: DEFAULT_QUARTO below, or
# the environment variable PIPSYS_QUARTO. Saved times stay UTC; generated
# report times are New York time (America/New_York). The script only reads
# package repositories (Git calls use --no-optional-locks) and writes only
# under this checkout: site/gen, site/_site, site/.quarto and .tmp/pipsys.
# Plan: .cg-docs/plans/2026-10-29-pipsystem-info-tools-v1.md

suppressPackageStartupMessages(suppressWarnings({
  library(data.table)
}))

PIPSYS_VERSION <- "v1"
DISPLAY_TZ <- "America/New_York"
DEFAULT_QUARTO <- paste0(
  "E:/PovcalNet/01.personal/wb384996/tools/quarto-1.8.27/bin/quarto.exe"
)
# Plan statuses treated as closed; every other status counts as open.
CLOSED_PLAN_STATUSES <- c("completed", "complete", "done", "superseded")

# ---- helpers -------------------------------------------------------------

# The pipsystem checkout that holds this script (tools/pipsys/ two levels
# down). Every write goes under this root.
pipsys_root <- function() {
  file_arg <- grep("^--file=", commandArgs(FALSE), value = TRUE)
  if (length(file_arg) == 1L) {
    script <- sub("^--file=", "", file_arg)
    return(normalizePath(
      file.path(dirname(script), "..", ".."),
      winslash = "/",
      mustWork = TRUE
    ))
  }
  return(normalizePath(getwd(), winslash = "/"))
}

# First element as character, or "-" when absent.
as_chr <- function(x) {
  if (is.null(x) || length(x) == 0L || all(is.na(x))) {
    return("-")
  }
  return(as.character(x[[1L]]))
}

# ISO 8601 text ("...Z" or "...+hh:mm", optional fractional seconds) to
# POSIXct UTC; fractional seconds are kept so ordering stays exact.
parse_utc <- function(x) {
  x <- as.character(x)
  zone <- regmatches(x, regexpr("(Z|[+-][0-9]{2}:?[0-9]{2})$", x), invert = FALSE)
  has_zone <- grepl("(Z|[+-][0-9]{2}:?[0-9]{2})$", x)
  offset <- rep(NA_real_, length(x))
  offset[has_zone] <- vapply(zone, function(z) {
    if (z == "Z") {
      return(0)
    }
    sign <- if (startsWith(z, "-")) -1 else 1
    digits <- gsub("[^0-9]", "", z)
    hours <- as.numeric(substr(digits, 1L, 2L))
    minutes <- as.numeric(substr(digits, 3L, 4L))
    return(sign * (hours * 3600 + minutes * 60))
  }, numeric(1L))
  base <- sub("(Z|[+-][0-9]{2}:?[0-9]{2})$", "", x)
  out <- as.POSIXct(base, format = "%Y-%m-%dT%H:%M:%OS", tz = "UTC") - offset
  return(out)
}

fmt_et <- function(x) {
  out <- format(x, "%Y-%m-%d %H:%M %Z", tz = DISPLAY_TZ)
  out[is.na(x)] <- "UNKNOWN"
  return(out)
}

# Markdown pipe table; "none" when there are no rows.
md_table <- function(dt) {
  if (!nrow(dt)) {
    return("none")
  }
  esc <- function(x) {
    x <- as.character(x)
    x[is.na(x) | !nzchar(x)] <- "-"
    x <- gsub("[\r\n]+", " ", x)
    return(gsub("|", "\\|", x, fixed = TRUE))
  }
  cells <- as.matrix(as.data.table(lapply(dt, esc)))
  header <- paste0("| ", paste(names(dt), collapse = " | "), " |")
  sep <- paste0("|", paste(rep("---", ncol(dt)), collapse = "|"), "|")
  body <- apply(cells, 1L, function(r) paste0("| ", paste(r, collapse = " | "), " |"))
  return(c(header, sep, unname(body)))
}

read_lines_utf8 <- function(file) {
  lines <- readLines(file, warn = FALSE, encoding = "UTF-8")
  if (length(lines)) {
    lines[1L] <- sub("^\ufeff", "", lines[1L])
  }
  return(lines)
}

# YAML frontmatter as a list (attribute "body_start"), or NULL.
read_frontmatter <- function(file, lines = read_lines_utf8(file)) {
  if (length(lines) < 3L || trimws(lines[1L]) != "---") {
    return(NULL)
  }
  end <- which(trimws(lines[-1L]) == "---")
  if (!length(end)) {
    return(NULL)
  }
  end <- end[1L] + 1L
  yaml_text <- paste(lines[seq.int(2L, length.out = end - 2L)], collapse = "\n")
  out <- tryCatch(yaml::yaml.load(yaml_text), error = function(e) NULL)
  if (!is.list(out)) {
    return(NULL)
  }
  attr(out, "body_start") <- end + 1L
  return(out)
}

read_packages <- function(root) {
  file <- file.path(root, "tools", "pipsys", "packages.csv")
  pk <- fread(file, colClasses = "character", na.strings = NULL)
  pk[is.na(path), path := ""]
  # The pipsystem row always describes the checkout that runs the script
  # (main checkout or an Agent Manager worktree).
  pk[package == "pipsystem", path := root]
  return(pk)
}

outputs_dir <- function(root) {
  return(file.path(root, ".cg-docs", "orchestration", "outputs"))
}

# ---- facts -----------------------------------------------------------------

# Read-only Git call: no optional locks (no index refresh) and no filesystem
# monitor (which could start a daemon or hook in the package's .git).
run_git <- function(path, args) {
  out <- suppressWarnings(system2(
    "git",
    c(
      "-C", shQuote(path, type = "cmd"),
      "-c", "core.fsmonitor=false",
      "--no-optional-locks", args
    ),
    stdout = TRUE,
    stderr = FALSE
  ))
  status <- attr(out, "status")
  if (!is.null(status) && status != 0L) {
    return(NULL)
  }
  return(out)
}

repo_info <- function(path) {
  info <- list(
    branch = "UNKNOWN",
    head = "-",
    head_time = as.POSIXct(NA, tz = "UTC"),
    uncommitted = NA_integer_,
    version = "-",
    note = "path UNKNOWN"
  )
  if (!nzchar(path) || !dir.exists(path)) {
    if (nzchar(path)) {
      info$note <- sprintf("path %s does not exist", path)
    }
    return(info)
  }
  desc <- file.path(path, "DESCRIPTION")
  info$version <- "none"
  if (file.exists(desc)) {
    v <- tryCatch(unname(read.dcf(desc, fields = "Version")[1L, 1L]), error = function(e) NA)
    if (!is.na(v)) {
      info$version <- v
    }
  }
  log <- run_git(path, c("log", "-1", "--format=%h%x09%ct"))
  if (is.null(log) || !length(log)) {
    info$note <- "not a Git repository or no commits"
    return(info)
  }
  parts <- strsplit(log[1L], "\t", fixed = TRUE)[[1L]]
  info$head <- parts[1L]
  info$head_time <- as.POSIXct(
    as.numeric(parts[2L]),
    origin = "1970-01-01",
    tz = "UTC"
  )
  failed <- character()
  branch <- run_git(path, c("branch", "--show-current"))
  if (is.null(branch)) {
    failed <- c(failed, "git branch")
  } else {
    info$branch <- if (length(branch) && nzchar(branch[1L])) {
      branch[1L]
    } else {
      "(detached)"
    }
  }
  status <- run_git(path, c("status", "--porcelain"))
  if (is.null(status)) {
    failed <- c(failed, "git status")
  } else {
    info$uncommitted <- length(status)
  }
  info$note <- if (length(failed)) {
    sprintf("%s failed", paste(failed, collapse = " and "))
  } else {
    ""
  }
  return(info)
}

plan_table <- function(path) {
  empty <- data.table(
    file = character(), title = character(), status = character(),
    date = character(), completed_phases = character()
  )
  dir <- file.path(path, ".cg-docs", "plans")
  if (!nzchar(path) || !dir.exists(dir)) {
    return(empty)
  }
  files <- sort(list.files(dir, pattern = "\\.md$", full.names = TRUE))
  if (!length(files)) {
    return(empty)
  }
  rows <- lapply(files, function(f) {
    fm <- read_frontmatter(f)
    if (is.null(fm)) {
      return(data.table(
        file = basename(f), title = "UNREADABLE", status = "UNREADABLE",
        date = "-", completed_phases = "-"
      ))
    }
    done <- fm[["completed-phases"]]
    return(data.table(
      file = basename(f),
      title = as_chr(fm$title),
      status = as_chr(fm$status),
      date = as_chr(fm$date),
      completed_phases = if (length(done)) paste(done, collapse = ", ") else "-"
    ))
  })
  return(rbindlist(rows))
}

# First non-empty line under a "## <heading>" line, cut to 100 characters.
first_line_under <- function(lines, heading) {
  at <- which(trimws(lines) == heading)
  if (!length(at)) {
    return("UNKNOWN")
  }
  rest <- lines[-seq_len(at[1L])]
  rest <- rest[nzchar(trimws(rest))]
  if (!length(rest) || startsWith(trimws(rest[1L]), "#")) {
    return("UNKNOWN")
  }
  return(substr(trimws(rest[1L]), 1L, 100L))
}

# Fallback for hand-written frontmatter that is not valid YAML (for example an
# unquoted value containing ": "): one "key: value" pair per line.
simple_frontmatter <- function(lines) {
  if (length(lines) < 3L || trimws(lines[1L]) != "---") {
    return(NULL)
  }
  end <- which(trimws(lines[-1L]) == "---")
  if (!length(end)) {
    return(NULL)
  }
  block <- lines[seq.int(2L, length.out = end[1L] - 1L)]
  hits <- regmatches(
    block,
    regexec("^([A-Za-z][A-Za-z0-9_-]*):[[:space:]]*(.*)$", block)
  )
  hits <- hits[lengths(hits) == 3L]
  if (!length(hits)) {
    return(NULL)
  }
  values <- lapply(hits, function(h) {
    v <- trimws(h[3L])
    # Block scalars (| or >) and nested values cannot be read line by line.
    if (!nzchar(v) || grepl("^[|>]", v)) {
      return(NA_character_)
    }
    # Each value is parsed as YAML on its own, so quoting, escapes and
    # comments follow YAML rules; a value that does not parse is UNKNOWN.
    parsed <- tryCatch(
      yaml::yaml.load(paste0("v: ", v)),
      error = function(e) NULL
    )
    # Only text values are kept; YAML booleans or numbers (for example
    # `next: no`) would change the recorded text, so they are UNKNOWN too.
    if (is.list(parsed) && is.character(parsed$v) && length(parsed$v) == 1L) {
      return(parsed$v)
    }
    return(NA_character_)
  })
  out <- stats::setNames(values, vapply(hits, `[`, character(1L), 2L))
  attr(out, "lenient") <- TRUE
  return(out)
}

read_handoff <- function(file) {
  parts <- rev(strsplit(normalizePath(file, winslash = "/"), "/", fixed = TRUE)[[1L]])
  row <- list(
    project = parts[4L], task = parts[3L], run = parts[2L],
    format = "other", status = "UNKNOWN",
    updated = as.POSIXct(NA, tz = "UTC"), next_action = "UNKNOWN"
  )
  lines <- read_lines_utf8(file)
  fm <- read_frontmatter(file, lines)
  if (is.null(fm)) {
    fm <- simple_frontmatter(lines)
  }
  if (!is.null(fm) && identical(as_chr(fm$schema), "pip-handoff-v2")) {
    known <- function(x) {
      v <- as_chr(x)
      return(if (identical(v, "-")) "UNKNOWN" else v)
    }
    lenient <- isTRUE(attr(fm, "lenient"))
    row$format <- if (lenient) "v2 (lenient)" else "v2"
    row$status <- known(fm$status)
    row$updated <- parse_utc(as_chr(fm$updated))
    row$next_action <- substr(known(fm[["next"]]), 1L, 100L)
    return(row)
  }
  start <- which(trimws(lines) == "```json")
  if (length(start)) {
    start <- start[1L]
    ends <- which(trimws(lines) == "```")
    end <- ends[ends > start][1L]
    if (!is.na(end) && end > start + 1L) {
      js <- tryCatch(
        jsonlite::fromJSON(
          paste(lines[(start + 1L):(end - 1L)], collapse = "\n"),
          simplifyVector = FALSE
        ),
        error = function(e) NULL
      )
      if (is.list(js) && identical(as_chr(js$schemaVersion), "pip-handoff-v1")) {
        row$format <- "v1"
        row$status <- as_chr(js$status)
        row$updated <- parse_utc(as_chr(js$updatedAt))
        row$next_action <- first_line_under(lines, "## Recommended Next Action")
      }
    }
  }
  return(row)
}

# All handoffs at <outputs>/<project>/<task>/<run>/handoff.md; latest run per
# project and task (newest `updated`, then run ID; unknown times last).
handoff_table <- function(outputs, latest = TRUE) {
  empty <- data.table(
    project = character(), task = character(), run = character(),
    format = character(), status = character(),
    updated = as.POSIXct(character(), tz = "UTC"), next_action = character()
  )
  if (!dir.exists(outputs)) {
    return(empty)
  }
  files <- list.files(outputs, pattern = "^handoff\\.md$", recursive = TRUE)
  files <- files[lengths(strsplit(files, "/", fixed = TRUE)) == 4L]
  if (!length(files)) {
    return(empty)
  }
  dt <- rbindlist(lapply(
    file.path(outputs, files),
    function(f) as.data.table(read_handoff(f))
  ))
  setorderv(
    dt, c("project", "task", "updated", "run"),
    order = c(1L, 1L, -1L, -1L), na.last = TRUE
  )
  if (latest) {
    dt <- unique(dt, by = c("project", "task"))
  }
  setorderv(
    dt, c("updated", "project", "task"),
    order = c(-1L, 1L, 1L), na.last = TRUE
  )
  return(dt[])
}

handoff_view <- function(dt) {
  return(dt[, .(
    project, task, run, status,
    updated = fmt_et(updated),
    `next` = next_action
  )])
}

roadmap_summary <- function(root) {
  file <- file.path(root, "roadmap.json")
  empty <- data.table(milestone = character(), status = character(), features_done = character())
  if (!file.exists(file)) {
    return(empty)
  }
  rm <- jsonlite::fromJSON(file, simplifyVector = FALSE)
  rows <- lapply(rm$milestones, function(m) {
    st <- vapply(m$features, function(f) as_chr(f$status), character(1L))
    data.table(
      milestone = as_chr(m$title),
      status = as_chr(m$status),
      features_done = sprintf("%d/%d", sum(st == "done"), length(st))
    )
  })
  return(if (length(rows)) rbindlist(rows) else empty)
}

roadmap_table <- function(root) {
  file <- file.path(root, "roadmap.json")
  if (!file.exists(file)) {
    return(data.table(milestone = character(), feature = character(), status = character(), plan = character()))
  }
  rm <- jsonlite::fromJSON(file, simplifyVector = FALSE)
  rows <- lapply(rm$milestones, function(m) {
    rbindlist(lapply(m$features, function(f) {
      data.table(
        milestone = as_chr(m$title),
        feature = as_chr(f$title),
        status = as_chr(f$status),
        plan = as_chr(f$plan)
      )
    }))
  })
  return(rbindlist(rows))
}

# ---- pipeline map (Plan C) -------------------------------------------------

MAP_FILE <- file.path("tables", "pipeline_map.csv")
MAP_COLUMNS <- c(
  "kind", "id", "field", "value", "status",
  "evidence_file", "evidence_line", "notes"
)
MAP_STATUSES <- c("decided", "harvested", "open", "unknown")
MAP_FIELDS <- list(
  stage = c("name", "owner", "outputs", "inputs", "entry_point"),
  edge = c("carries", "granularity", "invalidated_by")
)
MAP_STAGES <- as.character(1:10)

# The claims table, or NULL when tables/pipeline_map.csv does not exist.
read_map <- function(root) {
  file <- file.path(root, MAP_FILE)
  if (!file.exists(file)) {
    return(NULL)
  }
  return(fread(file, colClasses = "character", na.strings = NULL, encoding = "UTF-8"))
}

# Problems with evidence_file / evidence_line pairs: the file must be inside
# `root` and exist; each part of the line list must be N or N-M (N <= M) and
# within the file. Rows with an empty file are skipped. Returns (row, problem).
check_citations <- function(dt, root) {
  problems <- list()
  line_counts <- list()
  add <- function(i, text) {
    problems[[length(problems) + 1L]] <<- data.table(row = i, problem = text)
  }
  for (i in seq_len(nrow(dt))) {
    file <- dt$evidence_file[i]
    lines <- dt$evidence_line[i]
    if (!nzchar(file)) {
      next
    }
    if (grepl("^([A-Za-z]:|/|\\\\)", file) || grepl("(^|[/\\\\])\\.\\.([/\\\\]|$)", file)) {
      add(i, sprintf("evidence_file '%s' must be a path inside pipsystem", file))
      next
    }
    path <- file.path(root, file)
    if (file.exists(path) && !inside_root(path, root)) {
      add(i, sprintf("evidence_file '%s' resolves outside pipsystem", file))
      next
    }
    if (!file.exists(path)) {
      add(i, sprintf("evidence_file '%s' does not exist", file))
      next
    }
    if (is.null(line_counts[[file]])) {
      line_counts[[file]] <- length(readLines(path, warn = FALSE))
    }
    n <- line_counts[[file]]
    list_ok <- grepl(
      "^[[:space:]]*[0-9]+(-[0-9]+)?([[:space:]]*,[[:space:]]*[0-9]+(-[0-9]+)?)*[[:space:]]*$",
      lines
    )
    if (!list_ok) {
      add(i, sprintf("evidence_line '%s' is not N, N-M or a comma list of those", lines))
      next
    }
    for (part in trimws(strsplit(lines, ",", fixed = TRUE)[[1L]])) {
      m <- regmatches(part, regexec("^([0-9]+)(-([0-9]+))?$", part))[[1L]]
      from <- as.integer(m[2L])
      to <- if (nzchar(m[4L])) as.integer(m[4L]) else from
      if (from < 1L || to < from) {
        add(i, sprintf("evidence_line '%s' is not a forward range", part))
      } else if (to > n) {
        add(i, sprintf("evidence_line '%s' is beyond the end of %s (%d lines)", part, file, n))
      }
    }
  }
  if (!length(problems)) {
    return(data.table(row = integer(), problem = character()))
  }
  return(rbindlist(problems))
}

# Check tables/pipeline_map.csv (Plan C, requirement R3). Returns a list with
# the fixed-format report and the problems table.
check_map <- function(root = pipsys_root()) {
  problems <- list()
  add <- function(i, text) {
    problems[[length(problems) + 1L]] <<- data.table(row = i, problem = text)
  }
  map <- read_map(root)
  summary <- "none"
  if (is.null(map)) {
    add(0L, sprintf("%s not found", MAP_FILE))
  } else if (length(missing <- setdiff(MAP_COLUMNS, names(map)))) {
    add(0L, sprintf("missing columns: %s", paste(missing, collapse = ", ")))
  } else {
    rows <- seq_len(nrow(map))
    for (i in rows[!map$kind %chin% names(MAP_FIELDS)]) {
      add(i, sprintf("kind '%s' is not stage or edge", map$kind[i]))
    }
    for (i in rows[!map$status %chin% MAP_STATUSES]) {
      add(i, sprintf("status '%s' is not one of %s", map$status[i], paste(MAP_STATUSES, collapse = ", ")))
    }
    for (i in rows[map$kind %chin% names(MAP_FIELDS)]) {
      if (!map$field[i] %chin% MAP_FIELDS[[map$kind[i]]]) {
        add(i, sprintf("field '%s' is not allowed for kind %s", map$field[i], map$kind[i]))
      }
    }
    unknown <- map$status == "unknown"
    cited <- nzchar(map$evidence_file) & nzchar(map$evidence_line)
    uncited <- !nzchar(map$evidence_file) & !nzchar(map$evidence_line)
    for (i in rows[unknown & !(uncited & map$value == "UNKNOWN")]) {
      add(i, "an unknown row needs value UNKNOWN and no citation")
    }
    for (i in rows[!unknown & map$status %chin% MAP_STATUSES & !cited]) {
      add(i, "a decided, harvested or open row needs evidence_file and evidence_line")
    }
    # Status and evidence source must match (R2): decided and open rows cite
    # SYSTEM_DESIGN.md, harvested rows cite a note under notes/.
    design_rows <- rows[cited & map$status %chin% c("decided", "open")]
    for (i in design_rows[map$evidence_file[design_rows] != "SYSTEM_DESIGN.md"]) {
      add(i, sprintf("a %s row must cite SYSTEM_DESIGN.md", map$status[i]))
    }
    note_rows <- rows[cited & map$status == "harvested"]
    for (i in note_rows[!grepl("^notes/[^/]+\\.md$", map$evidence_file[note_rows])]) {
      add(i, "a harvested row must cite a note under notes/")
    }
    stage_rows <- rows[map$kind == "stage"]
    for (i in stage_rows[!map$id[stage_rows] %chin% MAP_STAGES]) {
      add(i, sprintf("stage id '%s' is not 1-10", map$id[i]))
    }
    names_dt <- unique(map[kind == "stage" & field == "name", .(id, value)])
    for (s in MAP_STAGES) {
      k <- names_dt[id == s, .N]
      if (k == 0L) {
        add(0L, sprintf("stage %s has no name row", s))
      } else if (k > 1L) {
        add(0L, sprintf("stage %s has %d different names", s, k))
      }
    }
    edge_rows <- rows[map$kind == "edge"]
    ends <- regmatches(map$id[edge_rows], regexec("^([0-9]+)->([0-9]+)$", map$id[edge_rows]))
    for (j in seq_along(edge_rows)) {
      e <- ends[[j]]
      if (!length(e) || !all(e[2:3] %chin% MAP_STAGES)) {
        add(edge_rows[j], sprintf("edge id '%s' is not <stage>-><stage> with stages 1-10", map$id[edge_rows[j]]))
      }
    }
    edges <- unique(map$id[edge_rows])
    with_carries <- unique(map[kind == "edge" & field == "carries", id])
    for (e in setdiff(edges, with_carries)) {
      add(0L, sprintf("edge %s has no carries row", e))
    }
    cit <- check_citations(map, root)
    if (nrow(cit)) {
      problems[[length(problems) + 1L]] <- cit
    }
    counts <- map[, .N, keyby = status]
    summary <- sprintf(
      "%d claims: %d stages, %d edges. Statuses: %s.",
      nrow(map),
      uniqueN(map[kind == "stage", id]),
      length(edges),
      paste(sprintf("%s %d", counts$status, counts$N), collapse = ", ")
    )
  }
  problems <- if (length(problems)) {
    rbindlist(problems)
  } else {
    data.table(row = integer(), problem = character())
  }
  report <- c(
    report_head("Pipeline map: check"),
    "## Summary", "",
    sprintf("File: `%s`. %s", MAP_FILE, summary), "",
    "## Problems", "",
    "Row numbers count data rows (the header is row 0).", "",
    md_table(problems), "",
    "## Gaps", "",
    "- Citations are checked for existence and line range only, not for meaning.",
    "- Evidence-only map, not a contract; the M2 Plan's E1-E11 contracts stay PROPOSED."
  )
  return(list(report = report, problems = problems))
}

# Mermaid label: first `carries` value, at most 40 characters, cut back to a
# word boundary when there is one.
edge_label <- function(x) {
  x <- gsub("\"", "'", x, fixed = TRUE)
  if (nchar(x) > 40L) {
    cut <- substr(x, 1L, 40L)
    if (substr(x, 41L, 41L) != " " && grepl("[[:space:]]", cut)) {
      cut <- sub("[[:space:]]+[^[:space:]]*$", "", cut)
    }
    x <- trimws(cut)
  }
  return(x)
}

map_page <- function(root) {
  map <- read_map(root)
  head <- c(
    "---", "title: Pipeline map", "---", "",
    sprintf("Generated %s from `%s`.", fmt_et(Sys.time()), MAP_FILE), "",
    paste(
      "Evidence-only map, not a contract. One claim per row with its own",
      "status: `decided` (a Decided line in SYSTEM_DESIGN.md), `harvested`",
      "(a note that cites package code), `open` (an Open line) or `unknown`.",
      "Run `tools\\pipsys\\pipsys.cmd check-map` to check the citations."
    ),
    ""
  )
  if (is.null(map)) {
    return(c(head, "none"))
  }
  names_dt <- unique(map[kind == "stage" & field == "name", .(id, value)], by = "id")
  nodes <- sprintf("  S%s[\"%s. %s\"]", names_dt$id, names_dt$id, gsub("\"", "'", names_dt$value))
  carries <- unique(map[kind == "edge" & field == "carries"], by = "id")
  links <- character()
  if (nrow(carries)) {
    ends <- tstrsplit(carries$id, "->", fixed = TRUE)
    links <- sprintf(
      "  S%s -->|\"%s\"| S%s",
      ends[[1L]], vapply(carries$value, edge_label, character(1L)), ends[[2L]]
    )
  }
  return(c(
    head,
    "```{mermaid}", "flowchart LR", nodes, links, "```", "",
    "## Claims", "",
    md_table(map)
  ))
}

# Stages whose owner claim names `pkg`: stage, name, outputs (first claim).
stage_table <- function(root, pkg) {
  map <- read_map(root)
  empty <- data.table(stage = character(), name = character(), outputs = character())
  if (is.null(map) || !all(MAP_COLUMNS %chin% names(map))) {
    return(empty)
  }
  owned <- unique(map[kind == "stage" & field == "owner" & value == pkg, id])
  if (!length(owned)) {
    return(empty)
  }
  first <- function(id_, field_) {
    v <- map[kind == "stage" & id == id_ & field == field_, value]
    return(if (length(v)) v[1L] else "UNKNOWN")
  }
  out <- data.table(
    stage = owned,
    name = vapply(owned, first, character(1L), field_ = "name"),
    outputs = vapply(owned, first, character(1L), field_ = "outputs")
  )
  return(out[order(as.integer(stage))])
}

# ---- documentation check (Plan B) ------------------------------------------

# Citations `path:N[-M][, N[-M]...]` in Markdown lines. A backtick span that
# starts with `path:<digit>` is one citation, taken whole (backtick_citations).
# Bare citations need a file extension and may not follow a letter, digit, `/`,
# `\`, `.`, `:` or `-`, so times (13:40) and URLs (host.org:8080) are not
# citations. Drive prefixes and backslashes are kept; check_doc rejects
# absolute paths, and check_citations() reports malformed line lists.
extract_citations <- function(lines) {
  pattern <- paste0(
    "(?<![A-Za-z0-9_./\\\\:-])",
    "((?:[A-Za-z]:[\\\\/])?[A-Za-z0-9_.\\\\][A-Za-z0-9_./\\\\-]*\\.[A-Za-z0-9]+)",
    ":([0-9]+(?:-[0-9A-Za-z]+)?",
    "(?:[ \\t]*,[ \\t]*[0-9][0-9A-Za-z]*(?:-[0-9A-Za-z]+)?)*)"
  )
  rows <- lapply(seq_along(lines), function(i) {
    bt <- backtick_citations(lines[i])
    hits <- regmatches(bt$rest, gregexpr(pattern, bt$rest, perl = TRUE))[[1L]]
    parts <- regmatches(hits, regexec(pattern, hits, perl = TRUE))
    bare <- data.table(
      citation = hits,
      evidence_file = vapply(parts, `[`, character(1L), 2L),
      evidence_line = vapply(parts, `[`, character(1L), 3L)
    )
    found <- rbind(bt$cit, bare)
    if (!nrow(found)) return(NULL)
    return(cbind(line = i, found))
  })
  out <- rbindlist(rows)
  if (!nrow(out)) {
    out <- data.table(
      line = integer(), citation = character(),
      evidence_file = character(), evidence_line = character()
    )
  }
  return(out)
}

# Check a document written by /pip-doc (Plan B, requirement R3). Returns a
# list with the fixed-format report and the problems table.
check_doc <- function(file, root = pipsys_root()) {
  if (!file.exists(file) || !inside_root(file, root)) {
    rlang::abort(sprintf("'%s' must be an existing file inside pipsystem.", file))
  }
  lines <- read_lines_utf8(file)
  problems <- list()
  add <- function(line, citation, text) {
    problems[[length(problems) + 1L]] <<- data.table(
      line = line, citation = citation, problem = text
    )
  }
  gaps_at <- which(trimws(lines) == "## Gaps")
  if (!length(gaps_at)) {
    add(0L, "-", "no ## Gaps section")
  } else {
    after <- lines[-seq_len(gaps_at[1L])]
    next_head <- which(grepl("^#{1,2} ", after))
    body <- if (length(next_head)) after[seq_len(next_head[1L] - 1L)] else after
    if (!any(nzchar(trimws(body)))) {
      add(gaps_at[1L], "-", "## Gaps section is empty")
    }
  }
  cit <- extract_citations(lines)
  cit[, evidence_file := gsub("\\", "/", evidence_file, fixed = TRUE)]
  packages <- setdiff(read_packages(root)$package, "pipsystem")
  first <- sub("/.*$", "", cit$evidence_file)
  is_package <- grepl("/", cit$evidence_file, fixed = TRUE) & first %chin% packages
  local <- cit[!is_package]
  bad <- check_citations(local, root)
  for (k in seq_len(nrow(bad))) {
    r <- local[bad$row[k]]
    add(r$line, r$citation, bad$problem[k])
  }
  problems <- if (length(problems)) {
    rbindlist(problems)
  } else {
    data.table(line = integer(), citation = character(), problem = character())
  }
  not_checked <- cit[is_package, .(line, citation)]
  report <- c(
    report_head("Document check"),
    "## Summary", "",
    sprintf(
      "File: `%s`. %d citations: %d local (checked), %d package (not checked).",
      normalizePath(file, winslash = "/"), nrow(cit), nrow(local), nrow(not_checked)
    ), "",
    "## Problems", "",
    "Line 0 means the whole document.", "",
    md_table(problems), "",
    "## Not checked", "",
    "Package citations start with a package name from tools/pipsys/packages.csv.", "",
    md_table(not_checked), "",
    "## Gaps", "",
    "- Citations are checked for existence and line range only, not for meaning.",
    "- Package citations are not checked (Later: check them at the recorded SHA)."
  )
  return(list(report = report, problems = problems))
}

# TRUE when `path` (existing or not) resolves inside the checkout, through
# junctions; /pip-doc runs it before it writes anything.
check_path <- function(path, root = pipsys_root()) {
  if (grepl("(^|[/\\\\])\\.\\.([/\\\\]|$)", path)) {
    return(FALSE)
  }
  return(inside_root(normalizePath(path, winslash = "/", mustWork = FALSE), root))
}

# Copy the tracked command and agent definitions (tools/pipsys/kilo/) into
# .kilo/, which Compound GPID keeps out of Git. Returns the copied paths.
install_kilo <- function(root = pipsys_root()) {
  src <- file.path(root, "tools", "pipsys", "kilo")
  copied <- character()
  for (kind in c("commands", "agents")) {
    files <- list.files(file.path(src, kind), pattern = "\\.md$", full.names = TRUE)
    dest_dir <- file.path(root, ".kilo", kind)
    if (!inside_root(dest_dir, root)) {
      rlang::abort(sprintf("Refusing to install: '%s' resolves outside '%s'.", dest_dir, root))
    }
    dir.create(dest_dir, recursive = TRUE, showWarnings = FALSE)
    for (f in files) {
      dest <- file.path(dest_dir, basename(f))
      if (!file.copy(f, dest, overwrite = TRUE)) {
        rlang::abort(sprintf("Could not copy '%s' to '%s'.", f, dest))
      }
      copied <- c(copied, sprintf(".kilo/%s/%s", kind, basename(f)))
    }
  }
  return(copied)
}

# ---- reports -----------------------------------------------------------

report_head <- function(title) {
  return(c(
    sprintf("# %s", title),
    "",
    sprintf("Generated %s by pipsys %s", fmt_et(Sys.time()), PIPSYS_VERSION),
    ""
  ))
}

report_status <- function(pkg, root = pipsys_root(),
                          ho = handoff_table(outputs_dir(root))) {
  pk <- read_packages(root)
  if (is.na(pkg) || !nzchar(pkg) || !pkg %chin% pk$package) {
    rlang::abort(sprintf(
      "Unknown package '%s'. Known packages: %s.",
      pkg, paste(pk$package, collapse = ", ")
    ))
  }
  path <- pk[package == pkg, path]
  info <- repo_info(path)
  repo <- data.table(
    path = if (nzchar(path)) path else "UNKNOWN",
    branch = info$branch,
    head = info$head,
    head_date = fmt_et(info$head_time),
    uncommitted = if (is.na(info$uncommitted)) "UNKNOWN" else info$uncommitted,
    version = info$version
  )
  plans <- plan_table(path)
  counts <- if (nrow(plans)) {
    tab <- plans[, .N, keyby = status]
    sprintf(
      "%d Plans: %s.", nrow(plans),
      paste(sprintf("%s %d", tab$status, tab$N), collapse = ", ")
    )
  } else {
    "none"
  }
  open_plans <- plans[!status %chin% CLOSED_PLAN_STATUSES]
  ho <- ho[project == pkg]

  gaps <- c(
    "Statuses are as recorded in the files, not verified.",
    sprintf(
      "Open Plans: status is not %s.",
      paste(CLOSED_PLAN_STATUSES, collapse = ", ")
    )
  )
  if (nzchar(info$note)) {
    gaps <- c(gaps, sprintf("Repository facts missing: %s.", info$note))
  }
  bad <- plans[status == "UNREADABLE", file]
  if (length(bad)) {
    gaps <- c(gaps, sprintf(
      "Unreadable Plan frontmatter: %s.",
      paste(bad, collapse = ", ")
    ))
  }
  gaps <- c(gaps, handoff_gaps(ho))
  gaps <- c(
    gaps,
    "Handoffs come only from pipsystem/.cg-docs/orchestration/outputs/."
  )

  return(c(
    report_head(sprintf("%s: status", pkg)),
    "## Repository", "", md_table(repo), "",
    "## Pipeline stages", "", md_table(stage_table(root, pkg)), "",
    "## Plans", "", counts, "",
    if (nrow(open_plans)) {
      c("Open Plans:", "", md_table(open_plans))
    } else {
      "Open Plans: none"
    },
    "",
    "## Handoffs", "", md_table(handoff_view(ho)), "",
    "## Gaps", "", paste0("- ", gaps)
  ))
}

# Gap lines about handoff formats that limit what a report can show.
handoff_gaps <- function(ho) {
  gaps <- character()
  other <- ho[format == "other", .N]
  if (other) {
    gaps <- c(gaps, sprintf(
      "%d task(s) have a latest handoff of unknown format; status shows UNKNOWN.",
      other
    ))
  }
  lenient <- ho[format == "v2 (lenient)", .N]
  if (lenient) {
    gaps <- c(gaps, sprintf(
      paste0(
        "%d latest v2 handoff(s) have invalid YAML and were read line by ",
        "line; multi-line fields show UNKNOWN."
      ),
      lenient
    ))
  }
  return(gaps)
}

report_overview <- function(root = pipsys_root(),
                            ho = handoff_table(outputs_dir(root))) {
  pk <- read_packages(root)
  rows <- lapply(seq_len(nrow(pk)), function(i) {
    name <- pk$package[i]
    path <- pk$path[i]
    if (!nzchar(path) || !dir.exists(path)) {
      return(data.table(
        package = name, branch = "UNKNOWN", head = "-", head_date = "-",
        uncommitted = "-", version = "-", open_plans = "-", last_handoff = "-"
      ))
    }
    info <- repo_info(path)
    plans <- plan_table(path)
    last <- ho[project == name][1L]
    last_handoff <- if (is.na(last$project)) {
      "none"
    } else {
      sprintf("%s %s", last$status, fmt_et(last$updated))
    }
    return(data.table(
      package = name,
      branch = info$branch,
      head = info$head,
      head_date = fmt_et(info$head_time),
      uncommitted = if (is.na(info$uncommitted)) {
        "UNKNOWN"
      } else {
        as.character(info$uncommitted)
      },
      version = info$version,
      open_plans = as.character(plans[!status %chin% CLOSED_PLAN_STATUSES, .N]),
      last_handoff = last_handoff,
      note = info$note
    ))
  })
  table <- rbindlist(rows, fill = TRUE)
  notes <- table[!is.na(note) & nzchar(note), sprintf("%s: %s.", package, note)]
  table[, note := NULL]
  unknown <- pk[!nzchar(path), package]
  gaps <- c(
    "Statuses are as recorded in the files, not verified.",
    sprintf(
      "open_plans counts Plans whose status is not %s.",
      paste(CLOSED_PLAN_STATUSES, collapse = ", ")
    ),
    "last_handoff uses pipsystem/.cg-docs/orchestration/outputs/ only."
  )
  if (length(unknown)) {
    gaps <- c(gaps, sprintf("Path UNKNOWN: %s.", paste(unknown, collapse = ", ")))
  }
  if (length(notes)) {
    gaps <- c(gaps, paste("Repository facts missing for", notes))
  }
  gaps <- c(gaps, handoff_gaps(unique(ho, by = "project")))
  return(c(
    report_head("PIP packages: overview"),
    "## Packages", "", md_table(table), "",
    "## Roadmap", "", md_table(roadmap_summary(root)), "",
    "## Gaps", "", paste0("- ", gaps)
  ))
}

report_handoffs <- function(project = NULL, root = pipsys_root(),
                            ho = handoff_table(outputs_dir(root))) {
  title <- "Handoffs: latest run per task"
  if (!is.null(project) && !is.na(project) && nzchar(project)) {
    known <- sort(unique(ho$project))
    if (!project %chin% known) {
      rlang::abort(sprintf(
        "No handoffs for project '%s'. Projects with handoffs: %s.",
        project, paste(known, collapse = ", ")
      ))
    }
    wanted <- project
    ho <- ho[ho$project == wanted]
    title <- sprintf("Handoffs: %s, latest run per task", project)
  }
  gaps <- c(
    "Statuses are as recorded in the files, not verified.",
    handoff_gaps(ho),
    "v1 'next' is the first line under 'Recommended Next Action'."
  )
  return(c(
    report_head(title),
    "## Handoffs", "", md_table(handoff_view(ho)), "",
    "## Gaps", "", paste0("- ", gaps)
  ))
}

# ---- site ------------------------------------------------------------------

# Rewrite relative Markdown link targets to absolute file:/// links.
rewrite_links <- function(lines, src_dir) {
  pattern <- "\\]\\(([^()[:space:]]+)\\)"
  fix_one <- function(line) {
    m <- gregexpr(pattern, line, perl = TRUE)
    hits <- regmatches(line, m)[[1L]]
    if (!length(hits)) {
      return(line)
    }
    new <- vapply(hits, function(h) {
      target <- sub(pattern, "\\1", h, perl = TRUE)
      if (grepl("^([a-zA-Z][a-zA-Z0-9+.-]*:|#|/)", target)) {
        return(h)
      }
      file_part <- sub("#.*$", "", target)
      anchor <- if (grepl("#", target, fixed = TRUE)) {
        sub("^[^#]*", "", target)
      } else {
        ""
      }
      abs <- normalizePath(
        file.path(src_dir, file_part),
        winslash = "/",
        mustWork = FALSE
      )
      return(sprintf("](file:///%s%s)", abs, anchor))
    }, character(1L))
    regmatches(line, m) <- list(new)
    return(line)
  }
  return(vapply(lines, fix_one, character(1L), USE.NAMES = FALSE))
}

# A copy of a Markdown file for the site: new frontmatter, a Source line,
# and file:/// links. Returns the lines.
copy_page <- function(src, title = NULL, subtitle_project = NULL) {
  lines <- read_lines_utf8(src)
  fm <- read_frontmatter(src, lines)
  body <- lines
  if (!is.null(fm)) {
    body_start <- attr(fm, "body_start")
    body_length <- max(0L, length(lines) - body_start + 1L)
    body <- lines[seq.int(body_start, length.out = body_length)]
  }
  if (is.null(title)) {
    title <- sub("\\.md$", "", basename(src))
    if (!is.null(fm) && !is.null(fm$title)) {
      title <- as_chr(fm$title)
    }
  }
  header <- list(title = title)
  if (!is.null(subtitle_project)) {
    status <- if (is.null(fm)) "UNREADABLE" else as_chr(fm$status)
    date <- if (is.null(fm)) "-" else as_chr(fm$date)
    header$subtitle <- paste(subtitle_project, status, date, sep = " \u00b7 ")
  }
  yaml_lines <- strsplit(yaml::as.yaml(header), "\n", fixed = TRUE)[[1L]]
  src_abs <- normalizePath(src, winslash = "/")
  return(c(
    "---", yaml_lines, "---", "",
    sprintf("Source: `%s`", src_abs), "",
    rewrite_links(body, dirname(src_abs))
  ))
}

# TRUE when `path` (or, if it does not exist yet, its nearest existing parent)
# resolves inside `root`; junctions and symbolic links are followed.
inside_root <- function(path, root) {
  probe <- path
  while (!file.exists(probe) && dirname(probe) != probe) {
    probe <- dirname(probe)
  }
  real <- tolower(normalizePath(probe, winslash = "/", mustWork = FALSE))
  base <- tolower(normalizePath(root, winslash = "/", mustWork = TRUE))
  return(identical(real, base) || startsWith(real, paste0(base, "/")))
}

# Delete and recreate <root>/site/gen. Refuses any other folder, a root that
# is not on E:, or a site without _quarto.yml.
reset_gen_dir <- function(gen, root) {
  gen <- normalizePath(gen, winslash = "/", mustWork = FALSE)
  root <- normalizePath(root, winslash = "/", mustWork = TRUE)
  expected <- paste0(root, "/site/gen")
  ok <- identical(tolower(gen), tolower(expected)) &&
    grepl("^[Ee]:/", root) &&
    file.exists(file.path(root, "site", "_quarto.yml"))
  if (!ok) {
    rlang::abort(sprintf(
      "Refusing to reset '%s': only <pipsystem root on E:>/site/gen is reset.",
      gen
    ))
  }
  unlink(gen, recursive = TRUE)
  dir.create(gen, recursive = TRUE)
  return(invisible(gen))
}

write_page <- function(file, lines) {
  dir.create(dirname(file), recursive = TRUE, showWarnings = FALSE)
  con <- file(file, open = "w", encoding = "UTF-8")
  on.exit(close(con))
  writeLines(lines, con)
  return(invisible(file))
}

# Turn a report (first line "# Title") into a page with a title block.
report_page <- function(report) {
  title <- sub("^# ", "", report[1L])
  return(c("---", sprintf("title: %s", yaml::as.yaml(title)), "---", "", report[-1L]))
}

build_site <- function(root = pipsys_root(),
                       quarto = Sys.getenv("PIPSYS_QUARTO", DEFAULT_QUARTO),
                       render = TRUE) {
  if (render && !file.exists(quarto)) {
    rlang::abort(sprintf("Quarto not found at '%s'. Set PIPSYS_QUARTO.", quarto))
  }
  site <- file.path(root, "site")
  gen <- reset_gen_dir(file.path(site, "gen"), root)
  pk <- read_packages(root)
  ho <- handoff_table(outputs_dir(root))

  write_page(
    file.path(gen, "overview.md"),
    report_page(report_overview(root, ho = ho))
  )
  write_page(
    file.path(gen, "handoffs.md"),
    report_page(report_handoffs(root = root, ho = ho))
  )
  write_page(file.path(gen, "roadmap.md"), c(
    "---", "title: Roadmap", "---", "",
    sprintf("Generated %s from `roadmap.json`.", fmt_et(Sys.time())), "",
    md_table(roadmap_table(root))
  ))
  # .qmd: Quarto treats a {mermaid} block as a diagram cell, which a .md page
  # may not contain. The page has no R or Python cells.
  write_page(file.path(gen, "map.qmd"), map_page(root))
  design <- file.path(root, "SYSTEM_DESIGN.md")
  if (file.exists(design)) {
    write_page(
      file.path(gen, "design.md"),
      copy_page(design, title = "System design")
    )
  }
  n_plans <- 0L
  for (i in seq_len(nrow(pk))) {
    name <- pk$package[i]
    write_page(
      file.path(gen, "status", paste0(name, ".md")),
      report_page(report_status(name, root, ho = ho))
    )
    path <- pk$path[i]
    plan_dir <- file.path(path, ".cg-docs", "plans")
    if (!nzchar(path) || !dir.exists(plan_dir)) {
      next
    }
    plan_files <- sort(list.files(plan_dir, pattern = "\\.md$", full.names = TRUE))
    for (f in plan_files) {
      write_page(
        file.path(gen, "plans", name, basename(f)),
        copy_page(f, subtitle_project = name)
      )
      n_plans <- n_plans + 1L
    }
  }
  out <- c(
    "# pipsys site", "",
    sprintf("Generated %s by pipsys %s", fmt_et(Sys.time()), PIPSYS_VERSION), "",
    sprintf(
      "- Pages written: %d Plans, %d status pages, overview, handoffs, roadmap, map, design.",
      n_plans, nrow(pk)
    )
  )
  if (!render) {
    return(out)
  }
  home <- file.path(root, ".tmp", "pipsys", "quarto-home")
  # Quarto state must stay inside this checkout, also through junctions:
  # check each folder (or its nearest existing parent) before creating it.
  for (d in c("local", "roaming", "deno")) {
    target <- file.path(home, d)
    if (!inside_root(target, root)) {
      rlang::abort(sprintf(
        "Refusing to render: '%s' resolves outside '%s'.",
        target, root
      ))
    }
    dir.create(target, recursive = TRUE, showWarnings = FALSE)
  }
  Sys.setenv(
    LOCALAPPDATA = file.path(home, "local"),
    APPDATA = file.path(home, "roaming"),
    DENO_DIR = file.path(home, "deno")
  )
  log <- suppressWarnings(system2(
    quarto,
    c("render", shQuote(site, type = "cmd")),
    stdout = TRUE,
    stderr = TRUE
  ))
  code <- attr(log, "status")
  code <- if (is.null(code)) 0L else code
  log_file <- file.path(root, ".tmp", "pipsys", "quarto-render.log")
  writeLines(log, log_file)
  index <- normalizePath(
    file.path(site, "_site", "index.html"),
    winslash = "/",
    mustWork = FALSE
  )
  out <- c(
    out,
    sprintf(
      "- Quarto render exit code: %d (log: `%s`)",
      code, normalizePath(log_file, winslash = "/")
    ),
    sprintf("- Site: `%s`%s", index, if (file.exists(index)) "" else " (missing)")
  )
  if (code != 0L) {
    out <- c(
      out, "", "Last lines of the Quarto log:", "",
      "```text", utils::tail(log, 30L), "```"
    )
    attr(out, "status") <- code
  }
  return(out)
}

# ---- entry point -------------------------------------------------------

main <- function(args = commandArgs(trailingOnly = TRUE)) {
  cmd <- if (length(args)) args[1L] else ""
  arg2 <- if (length(args) > 1L) args[2L] else NA_character_
  out <- tryCatch(
    switch(
      cmd,
      status = report_status(arg2),
      overview = report_overview(),
      handoffs = report_handoffs(arg2),
      site = build_site(),
      `check-map` = {
        res <- check_map()
        out <- res$report
        if (nrow(res$problems)) {
          attr(out, "status") <- 1L
        }
        out
      },
      `check-doc` = {
        if (is.na(arg2)) {
          rlang::abort("Usage: check-doc <file inside pipsystem>")
        }
        res <- check_doc(normalizePath(arg2, winslash = "/", mustWork = FALSE))
        out <- res$report
        if (nrow(res$problems)) {
          attr(out, "status") <- 1L
        }
        out
      },
      `check-path` = {
        if (is.na(arg2)) {
          rlang::abort("Usage: check-path <path>")
        }
        if (!check_path(arg2)) {
          rlang::abort(sprintf("'%s' is outside the pipsystem checkout.", arg2))
        }
        sprintf("inside: %s", normalizePath(arg2, winslash = "/", mustWork = FALSE))
      },
      `install-kilo` = c("Installed:", install_kilo()),
      rlang::abort(sprintf(
        paste0(
          "Unknown subcommand '%s'. Use: status <package>, overview, ",
          "handoffs [project], site, check-map, check-doc <file>, ",
          "check-path <path>, install-kilo."
        ),
        cmd
      ))
    ),
    error = function(e) {
      rlang::inform(paste0("pipsys: ", conditionMessage(e)))
      quit(save = "no", status = 1L)
    }
  )
  writeLines(out)
  status <- attr(out, "status")
  if (!is.null(status)) {
    quit(save = "no", status = status)
  }
  return(invisible(out))
}

# Citations written as one backtick span `path:lines`, the /pip-doc form (used
# by extract_citations). The whole text after the colon is the line list, so
# partial or malformed lists (`1, bad`, `1-`, `1-2-999`) and absolute paths
# (`/notes/a.md:9`) reach check_citations(). Returns the citations and the
# text with those spans removed. Defined here, after main(), so that line
# numbers cited in docs/pipsys-tools.md stay valid.
backtick_citations <- function(text) {
  spans <- regmatches(text, gregexpr("`[^`]+`", text))[[1L]]
  inner <- substr(spans, 2L, nchar(spans) - 1L)
  cit_re <- "^((?:[A-Za-z]:)?[A-Za-z0-9_./\\\\-]*\\.[A-Za-z0-9]+):([0-9].*)$"
  is_cit <- grepl(cit_re, inner, perl = TRUE)
  parts <- regmatches(inner[is_cit], regexec(cit_re, inner[is_cit], perl = TRUE))
  cit <- data.table(
    citation = inner[is_cit],
    evidence_file = vapply(parts, `[`, character(1L), 2L),
    evidence_line = vapply(parts, `[`, character(1L), 3L)
  )
  rest <- text
  for (s in spans[is_cit]) {
    rest <- sub(s, " ", rest, fixed = TRUE)
  }
  return(list(cit = cit, rest = rest))
}

if (sys.nframe() == 0L) {
  main()
}
