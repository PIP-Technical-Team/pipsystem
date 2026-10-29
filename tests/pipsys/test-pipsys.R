# Unit tests for tools/pipsys/pipsys.R (pipsys v1).
#
# Run from the pipsystem root, with TEMP, TMP and TMPDIR set to .tmp/pipsys:
#   Rscript --no-init-file -e "testthat::test_file('tests/pipsys/test-pipsys.R')"

library(testthat)
# data.table may warn that it was built under a newer R patch release.
suppressWarnings(library(data.table))

script <- normalizePath(
  file.path("..", "..", "tools", "pipsys", "pipsys.R"),
  winslash = "/",
  mustWork = TRUE
)
ps <- new.env()
sys.source(script, envir = ps)

write_lines <- function(path, lines) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  writeLines(lines, path, useBytes = TRUE)
  invisible(path)
}

# A fake pipsystem root with a package list, a roadmap and handoffs.
make_root <- function(dir, packages) {
  write_lines(
    file.path(dir, "tools", "pipsys", "packages.csv"),
    c("package,path", sprintf("%s,%s", names(packages), packages))
  )
  write_lines(
    file.path(dir, "roadmap.json"),
    c(
      '{"milestones": [{"id": "m0", "title": "M0 Design", "status": "done",',
      '"features": [{"id": "a", "title": "A", "status": "done", "plan": null},',
      '{"id": "b", "title": "B", "status": "idea", "plan": null}]}]}'
    )
  )
  dir.create(
    file.path(dir, ".cg-docs", "orchestration", "outputs"),
    recursive = TRUE,
    showWarnings = FALSE
  )
  invisible(dir)
}

# A Git repository with one commit of DESCRIPTION (Version 1.2.3).
make_git_repo <- function(dir) {
  write_lines(file.path(dir, "DESCRIPTION"), c("Package: demo", "Version: 1.2.3"))
  git <- function(...) {
    system2("git", c("-C", dir, ...), stdout = FALSE, stderr = FALSE)
  }
  git("init", "-q")
  git("add", "DESCRIPTION")
  git(
    "-c", "user.name=t", "-c", "user.email=t@example.org",
    "commit", "-q", "-m", "init"
  )
  return(normalizePath(dir, winslash = "/"))
}

v2_lines <- function(run, status, updated, next_action = "do X") {
  c(
    "---",
    "schema: pip-handoff-v2",
    "project: demo",
    "task: build",
    sprintf("run: %s", run),
    sprintf("status: %s", status),
    sprintf("updated: %s", updated),
    sprintf("next: %s", next_action),
    "---",
    "",
    "# Report"
  )
}

v1_lines <- c(
  "# Old report",
  "",
  "```json",
  "{",
  '  "schemaVersion": "pip-handoff-v1",',
  '  "taskId": "legacy",',
  '  "runId": "r1",',
  '  "status": "blocked",',
  '  "updatedAt": "2026-10-29T15:30:00Z"',
  "}",
  "```",
  "",
  "## Recommended Next Action",
  "",
  "User decides D1 | then resumes.",
  ""
)

test_that("times print in New York time with EDT or EST", {
  expect_equal(
    ps$fmt_et(ps$parse_utc("2026-10-29T17:40:00Z")),
    "2026-10-29 13:40 EDT"
  )
  expect_equal(
    ps$fmt_et(ps$parse_utc("2026-11-02T17:40:00Z")),
    "2026-11-02 12:40 EST"
  )
  expect_equal(
    ps$fmt_et(ps$parse_utc("2026-10-29T17:40:00.123Z")),
    "2026-10-29 13:40 EDT"
  )
  expect_equal(ps$fmt_et(ps$parse_utc("not a time")), "UNKNOWN")
  expect_equal(ps$fmt_et(ps$parse_utc(NA_character_)), "UNKNOWN")
})

test_that("handoffs: v2, v1 and other formats are read", {
  out <- withr::local_tempdir()
  f2 <- write_lines(
    file.path(out, "demo", "build", "run2", "handoff.md"),
    v2_lines("run2", "completed", "2026-10-29T17:00:00Z")
  )
  f1 <- write_lines(file.path(out, "demo", "legacy", "r1", "handoff.md"), v1_lines)
  f0 <- write_lines(
    file.path(out, "demo", "misc", "x", "handoff.md"),
    c("# Free text", "Status: done")
  )

  h2 <- ps$read_handoff(f2)
  expect_equal(h2$format, "v2")
  expect_equal(h2$status, "completed")
  expect_equal(h2$next_action, "do X")
  expect_equal(c(h2$project, h2$task, h2$run), c("demo", "build", "run2"))

  h1 <- ps$read_handoff(f1)
  expect_equal(h1$format, "v1")
  expect_equal(h1$status, "blocked")
  expect_equal(ps$fmt_et(h1$updated), "2026-10-29 11:30 EDT")
  expect_equal(h1$next_action, "User decides D1 | then resumes.")

  h0 <- ps$read_handoff(f0)
  expect_equal(h0$format, "other")
  expect_equal(h0$status, "UNKNOWN")
  expect_true(is.na(h0$updated))

  # v2 frontmatter that is not valid YAML is still read line by line.
  fb <- write_lines(
    file.path(out, "demo", "loose", "r9", "handoff.md"),
    c(
      "---", "schema: pip-handoff-v2", "status: completed # final",
      "updated: 2026-10-29T17:31:00Z",
      'plan: NONE (user said: "use NY time")', "next: check", "---"
    )
  )
  expect_null(ps$read_frontmatter(fb))
  hb <- ps$read_handoff(fb)
  expect_equal(hb$format, "v2 (lenient)")
  expect_equal(hb$status, "completed")
  expect_equal(hb$next_action, "check")
  expect_equal(ps$fmt_et(hb$updated), "2026-10-29 13:31 EDT")

  # A multi-line field cannot be read line by line: UNKNOWN, not ">-".
  fm <- write_lines(
    file.path(out, "demo", "loose2", "r1", "handoff.md"),
    c(
      "---", "schema: pip-handoff-v2", 'status: "completed" # final',
      'plan: bad: "x"', "next: >-", "  user approves D1",
      'owner: "Review \\"D1\\" first"', "task: 'User''s task'", "run: no", "---"
    )
  )
  hm <- ps$read_handoff(fm)
  expect_equal(hm$next_action, "UNKNOWN")
  expect_equal(hm$status, "completed")
  loose <- ps$simple_frontmatter(ps$read_lines_utf8(fm))
  expect_equal(loose$owner, "Review \"D1\" first")
  expect_equal(loose$task, "User's task")
  expect_true(is.na(loose$plan))
  expect_true(is.na(loose$run))
})

test_that("inside_root follows junctions", {
  root <- withr::local_tempdir()
  outside <- withr::local_tempdir()
  expect_true(ps$inside_root(file.path(root, "a", "b"), root))
  expect_false(ps$inside_root(outside, root))
  Sys.junction(outside, file.path(root, "link"))
  withr::defer(system2(
    "cmd",
    c("/c", "rmdir", shQuote(gsub("/", "\\\\", file.path(root, "link")))),
    stdout = FALSE, stderr = FALSE
  ))
  expect_false(ps$inside_root(file.path(root, "link", "new"), root))
})

test_that("handoff_table orders by updated time, then run ID", {
  out <- withr::local_tempdir()
  # The lexically earlier run has the newer update and must win.
  write_lines(
    file.path(out, "demo", "build", "20261029T100000Z-a", "handoff.md"),
    v2_lines("a", "completed", "2026-10-29T15:00:00Z")
  )
  write_lines(
    file.path(out, "demo", "build", "20261029T120000Z-b", "handoff.md"),
    v2_lines("b", "blocked", "2026-10-29T12:00:00Z")
  )
  write_lines(
    file.path(out, "demo", "build", "20261029T130000Z-c", "handoff.md"),
    c("# no format")
  )
  write_lines(
    file.path(out, "demo", "build", "20261029T120000Z-b", "runtime", "x", "handoff.md"),
    v2_lines("z", "running", "2026-10-30T12:00:00Z")
  )
  # Equal times: the greater run ID wins.
  write_lines(
    file.path(out, "demo", "tie", "r1", "handoff.md"),
    v2_lines("r1", "blocked", "2026-10-29T12:00:00Z")
  )
  write_lines(
    file.path(out, "demo", "tie", "r2", "handoff.md"),
    v2_lines("r2", "completed", "2026-10-29T12:00:00Z")
  )
  # Fractional seconds decide the order, not the run ID.
  write_lines(
    file.path(out, "demo", "frac", "r1", "handoff.md"),
    v2_lines("r1", "completed", "2026-10-29T12:00:00.900Z")
  )
  write_lines(
    file.path(out, "demo", "frac", "r2", "handoff.md"),
    v2_lines("r2", "blocked", "2026-10-29T12:00:00.100Z")
  )
  dt <- ps$handoff_table(out)
  expect_equal(nrow(dt), 3L)
  expect_equal(dt[task == "build", run], "20261029T100000Z-a")
  expect_equal(dt[task == "tie", run], "r2")
  expect_equal(dt[task == "frac", run], "r1")
})

test_that("malformed frontmatter is reported, not fatal", {
  repo <- withr::local_tempdir()
  write_lines(
    file.path(repo, ".cg-docs", "plans", "2026-01-01-good.md"),
    c("---", "title: Good", "status: active", "date: 2026-01-01", "---", "# Body")
  )
  write_lines(
    file.path(repo, ".cg-docs", "plans", "2026-01-02-bad.md"),
    c("---", "title: [unclosed", "---", "# Body")
  )
  expect_null(ps$read_frontmatter(file.path(repo, ".cg-docs", "plans", "2026-01-02-bad.md")))
  dt <- ps$plan_table(repo)
  expect_equal(nrow(dt), 2L)
  expect_equal(dt[file == "2026-01-02-bad.md", status], "UNREADABLE")
  expect_equal(dt[file == "2026-01-01-good.md", title], "Good")
})

test_that("repo_info reads Git facts and DESCRIPTION without failing", {
  repo <- make_git_repo(withr::local_tempdir())
  write_lines(file.path(repo, "new.txt"), "x")
  info <- ps$repo_info(repo)
  expect_equal(info$version, "1.2.3")
  expect_equal(info$uncommitted, 1L)
  expect_true(nzchar(info$branch) && info$branch != "UNKNOWN")
  expect_match(info$head, "^[0-9a-f]{7,}$")
  expect_false(is.na(info$head_time))

  missing <- ps$repo_info("")
  expect_equal(missing$branch, "UNKNOWN")
})

test_that("failed Git queries stay unknown instead of looking clean", {
  repo <- withr::local_tempdir()
  real <- ps$run_git
  withr::defer(assign("run_git", real, envir = ps))
  assign("run_git", function(path, args) {
    if (identical(args[1L], "log")) "abc1234\t1793212833" else NULL
  }, envir = ps)
  info <- ps$repo_info(repo)
  expect_equal(info$head, "abc1234")
  expect_equal(info$branch, "UNKNOWN")
  expect_true(is.na(info$uncommitted))
  expect_match(info$note, "git branch and git status failed")
})

test_that("status report has fixed sections; unknown package errors", {
  root <- make_root(withr::local_tempdir(), c(demo = "", other = ""))
  out <- ps$report_status("demo", root = root)
  heads <- grep("^## ", out, value = TRUE)
  expect_equal(
    heads,
    c("## Repository", "## Pipeline stages", "## Plans", "## Handoffs", "## Gaps")
  )
  expect_match(out[1], "^# demo: status$")
  expect_match(out[3], "^Generated .* by pipsys v1$")
  expect_true(any(grepl("UNKNOWN", out)))
  # No map file in this fixture: the stages section says none.
  stages <- out[which(out == "## Pipeline stages") + 2L]
  expect_equal(stages, "none")
  gaps <- out[(which(out == "## Gaps") + 1L):length(out)]
  expect_true(any(grepl("^- ", gaps)))
  expect_error(ps$report_status("nope", root = root), "demo, other")
})

# ---- pipeline map (Plan C) ---------------------------------------------------

map_header <- "kind,id,field,value,status,evidence_file,evidence_line,notes"

# A valid map: ten stages owned by demo or other, two edges, one unknown row.
valid_map_lines <- function() {
  stages <- unlist(lapply(1:10, function(i) {
    owner <- if (i %in% c(3L, 4L)) "demo" else "other"
    c(
      sprintf("stage,%d,name,Stage %d,decided,SYSTEM_DESIGN.md,%d,", i, i, i),
      sprintf("stage,%d,owner,%s,decided,SYSTEM_DESIGN.md,%d,", i, owner, i)
    )
  }))
  c(
    map_header,
    stages,
    "stage,3,name,Stage 3,decided,SYSTEM_DESIGN.md,2-3,second citation",
    "stage,2,entry_point,UNKNOWN,unknown,,,",
    "edge,3->4,carries,clean welfare,decided,SYSTEM_DESIGN.md,\"4,5\",",
    "edge,4->5,carries,PPP welfare in one column per PPP year and more text here,decided,SYSTEM_DESIGN.md,6,",
    "edge,4->5,granularity,per estimation,decided,SYSTEM_DESIGN.md,7,"
  )
}

make_map_root <- function(map_lines) {
  root <- make_root(
    withr::local_tempdir(.local_envir = parent.frame()),
    c(demo = "", other = "")
  )
  write_lines(file.path(root, "SYSTEM_DESIGN.md"), sprintf("line %d", 1:20))
  write_lines(file.path(root, "notes", "a.md"), sprintf("note %d", 1:5))
  write_lines(file.path(root, "tables", "pipeline_map.csv"), map_lines)
  return(root)
}

test_that("check-map passes a valid map with an unknown row", {
  root <- make_map_root(valid_map_lines())
  res <- ps$check_map(root)
  expect_equal(nrow(res$problems), 0L)
  expect_match(paste(res$report, collapse = "\n"), "10 stages", fixed = TRUE)
  expect_match(paste(res$report, collapse = "\n"), "2 edges", fixed = TRUE)
  heads <- grep("^## ", res$report, value = TRUE)
  expect_equal(heads, c("## Summary", "## Problems", "## Gaps"))
})

test_that("check-map names the row and the problem of each case", {
  base <- valid_map_lines()
  added <- length(base) # data row number of one appended line
  cases <- list(
    bad_status = list(c(base, "stage,1,inputs,x,guessed,SYSTEM_DESIGN.md,1,"), added, "status 'guessed'"),
    two_names = list(c(base, "stage,1,name,Other name,decided,SYSTEM_DESIGN.md,1,"), 0L, "stage 1 has 2 different names"),
    missing_stage = list(base[!grepl("^stage,10,name", base)], 0L, "stage 10 has no name row"),
    edge_to_11 = list(c(base, "edge,4->11,carries,x,decided,SYSTEM_DESIGN.md,1,"), added, "edge id '4->11'"),
    edge_no_carries = list(c(base, "edge,1->3,granularity,x,decided,SYSTEM_DESIGN.md,1,"), 0L, "edge 1->3 has no carries row"),
    unknown_cited = list(c(base, "stage,1,inputs,UNKNOWN,unknown,SYSTEM_DESIGN.md,1,"), added, "unknown row needs"),
    known_uncited = list(c(base, "stage,1,inputs,x,decided,,,"), added, "needs evidence_file"),
    missing_file = list(c(base, "stage,1,inputs,x,harvested,notes/nope.md,1,"), added, "'notes/nope.md' does not exist"),
    outside_file = list(c(base, "stage,1,inputs,x,harvested,notes/../../a.md,1,"), added, "inside pipsystem", 2L),
    line_too_far = list(c(base, "stage,1,inputs,x,decided,SYSTEM_DESIGN.md,21,"), added, "beyond the end"),
    bad_range = list(c(base, "stage,1,inputs,x,decided,SYSTEM_DESIGN.md,3-a,"), added, "not N, N-M"),
    trailing_comma = list(c(base, "stage,1,inputs,x,decided,SYSTEM_DESIGN.md,\"1,\","), added, "not N, N-M"),
    only_comma = list(c(base, "stage,1,inputs,x,decided,SYSTEM_DESIGN.md,\",\","), added, "not N, N-M"),
    backwards = list(c(base, "stage,1,inputs,x,decided,SYSTEM_DESIGN.md,4-2,"), added, "not a forward range"),
    bad_kind = list(c(base, "node,1,inputs,x,decided,SYSTEM_DESIGN.md,1,"), added, "kind 'node'"),
    bad_field = list(c(base, "stage,1,colour,x,decided,SYSTEM_DESIGN.md,1,"), added, "field 'colour'"),
    decided_note = list(c(base, "stage,1,inputs,x,decided,notes/a.md,1,"), added, "must cite SYSTEM_DESIGN.md"),
    harvested_design = list(c(base, "stage,1,inputs,x,harvested,SYSTEM_DESIGN.md,1,"), added, "must cite a note")
  )
  for (name in names(cases)) {
    case <- cases[[name]]
    res <- ps$check_map(make_map_root(case[[1L]]))
    hit <- res$problems[row == case[[2L]] & grepl(case[[3L]], problem, fixed = TRUE)]
    expect_equal(nrow(hit), 1L, label = name)
    n_expected <- if (length(case) > 3L) case[[4L]] else 1L
    expect_equal(nrow(res$problems), n_expected, label = paste(name, "(problem count)"))
  }

  # Drop the last field (notes) of every line, header included.
  missing_col <- sub(",[^,]*$", "", valid_map_lines())
  res <- ps$check_map(make_map_root(missing_col))
  expect_equal(res$problems$problem, "missing columns: notes")
})

test_that("check_citations accepts N, N-M and lists and rejects others", {
  root <- withr::local_tempdir()
  write_lines(file.path(root, "a.md"), sprintf("l%d", 1:5))
  dt <- data.table(
    evidence_file = rep("a.md", 7L),
    evidence_line = c("1", "2-5", "1, 3-4", "4-2", "6", "1,", ",")
  )
  bad <- ps$check_citations(dt, root)
  expect_equal(sort(bad$row), 4:7)

  # A relative path through a junction that leaves the root is refused.
  outside <- withr::local_tempdir()
  write_lines(file.path(outside, "b.md"), "x")
  Sys.junction(outside, file.path(root, "link"))
  withr::defer(system2(
    "cmd",
    c("/c", "rmdir", shQuote(gsub("/", "\\\\", file.path(root, "link")))),
    stdout = FALSE, stderr = FALSE
  ))
  bad <- ps$check_citations(data.table(evidence_file = "link/b.md", evidence_line = "1"), root)
  expect_match(bad$problem, "resolves outside", fixed = TRUE)
})

test_that("map page has a Mermaid flowchart and the status lists owned stages", {
  root <- make_map_root(valid_map_lines())
  page <- ps$map_page(root)
  start <- which(page == "```{mermaid}")
  expect_length(start, 1L)
  expect_equal(page[start + 1L], "flowchart LR")
  expect_true(any(page == "  S3 -->|\"clean welfare\"| S4"))
  # Labels are cut to at most 40 characters at a word boundary.
  expect_true(any(page == "  S4 -->|\"PPP welfare in one column per PPP year\"| S5"))
  expect_equal(ps$edge_label(strrep("x", 50L)), strrep("x", 40L))
  expect_equal(ps$edge_label("short"), "short")

  out <- ps$report_status("demo", root = root)
  at <- which(out == "## Pipeline stages")
  expect_match(out[at + 2L], "^\\| stage \\| name \\|")
  rows <- grep("^\\| [0-9]+ \\| Stage ", out, value = TRUE)
  expect_equal(sub("^\\| ([0-9]+) .*$", "\\1", rows), c("3", "4"))
  # A registered package that owns no stage in an existing map: none.
  root2 <- make_map_root(valid_map_lines())
  write_lines(
    file.path(root2, "tools", "pipsys", "packages.csv"),
    c("package,path", "demo,", "other,", "idle,")
  )
  out2 <- ps$report_status("idle", root = root2)
  expect_equal(out2[which(out2 == "## Pipeline stages") + 2L], "none")
})

test_that("a valid map without edges renders a stage-only diagram", {
  stages_only <- valid_map_lines()
  stages_only <- stages_only[!grepl("^edge,", stages_only)]
  root <- make_map_root(stages_only)
  expect_equal(nrow(ps$check_map(root)$problems), 0L)
  page <- ps$map_page(root)
  expect_false(any(grepl("-->", page, fixed = TRUE)))
  expect_true(any(page == "  S10[\"10. Stage 10\"]"))
})

test_that("overview has the fixed columns and one row per package", {
  repo <- make_git_repo(withr::local_tempdir())
  plans <- file.path(repo, ".cg-docs", "plans")
  write_lines(
    file.path(plans, "2026-01-01-open.md"),
    c("---", "title: Open", "status: active", "---")
  )
  write_lines(
    file.path(plans, "2026-01-02-done.md"),
    c("---", "title: Done", "status: completed", "---")
  )
  root <- make_root(
    withr::local_tempdir(),
    c(demo = repo, ghost = "", pipsystem = "E:/elsewhere")
  )
  write_lines(
    file.path(root, ".cg-docs", "orchestration", "outputs", "demo", "build", "r1", "handoff.md"),
    v2_lines("r1", "completed", "2026-10-29T17:00:00Z")
  )
  out <- ps$report_overview(root = root)
  header <- grep("^\\| package \\|", out, value = TRUE)
  expect_equal(
    header,
    paste0(
      "| package | branch | head | head_date | uncommitted | version | ",
      "open_plans | last_handoff |"
    )
  )
  start <- which(out == header)
  end <- which(out == "## Roadmap") - 2L
  rows <- out[(start + 2L):end]
  expect_equal(length(rows), 3L)
  cells <- trimws(strsplit(rows[1], "|", fixed = TRUE)[[1L]])[-1L]
  expect_equal(cells[1], "demo")
  # The untracked .cg-docs folder counts as one uncommitted entry.
  expect_equal(cells[5:8], c("1", "1.2.3", "1", "completed 2026-10-29 13:00 EDT"))
  expect_match(rows[2], "^\\| ghost \\| UNKNOWN \\| - \\| - \\| - \\| - \\| - \\| - \\|$")
  # The pipsystem row reads the running checkout (an existing folder without
  # DESCRIPTION, so version "none"), not the unknown CSV path.
  pip_cells <- trimws(strsplit(rows[3], "|", fixed = TRUE)[[1L]])[-1L]
  expect_equal(pip_cells[c(1L, 6L)], c("pipsystem", "none"))
  expect_true(any(grepl("^\\| M0 Design \\| done \\| 1/2 \\|$", out)))
  expect_equal(
    ps$read_packages(root)[package == "pipsystem", path],
    root
  )
})

test_that("handoffs report filters by project and rejects unknown ones", {
  root <- make_root(withr::local_tempdir(), c(demo = ""))
  out_dir <- file.path(root, ".cg-docs", "orchestration", "outputs")
  write_lines(
    file.path(out_dir, "alpha", "build", "r1", "handoff.md"),
    v2_lines("r1", "completed", "2026-10-29T10:00:00Z")
  )
  write_lines(
    file.path(out_dir, "beta", "build", "r1", "handoff.md"),
    v2_lines("r1", "running", "2026-10-29T11:00:00Z")
  )
  out <- ps$report_handoffs("alpha", root = root)
  rows <- grep("^\\| (alpha|beta) \\|", out, value = TRUE)
  expect_equal(length(rows), 1L)
  expect_match(rows, "^\\| alpha \\|")
  expect_error(ps$report_handoffs("gamma", root = root), "alpha, beta")
})

test_that("md_table escapes pipes and prints none for no rows", {
  expect_equal(ps$md_table(data.table(a = character())), "none")
  tab <- ps$md_table(data.table(a = "x|y", b = NA_character_))
  expect_equal(tab[3], "| x\\|y | - |")
})

test_that("plan copies get new frontmatter, a source line and file links", {
  src_dir <- withr::local_tempdir()
  src <- write_lines(
    file.path(src_dir, ".cg-docs", "plans", "2026-01-01-p.md"),
    c(
      "---",
      'title: "My plan"',
      "status: active",
      "date: 2026-01-01",
      'language: "R"',
      "---",
      "",
      "See [design](../../SYSTEM_DESIGN.md), [web](https://example.org),",
      "[anchor](#objective) and [mail](mailto:a@b.org)."
    )
  )
  out <- ps$copy_page(src, title = NULL, subtitle_project = "demo")
  fm_end <- which(out == "---")[2]
  fm <- yaml::yaml.load(paste(out[2:(fm_end - 1L)], collapse = "\n"))
  expect_equal(sort(names(fm)), c("subtitle", "title"))
  expect_equal(fm$title, "My plan")
  expect_equal(fm$subtitle, "demo \u00b7 active \u00b7 2026-01-01")
  body <- paste(out[(fm_end + 1L):length(out)], collapse = "\n")
  expect_match(body, "Source: `", fixed = TRUE)
  target <- normalizePath(file.path(src_dir, "SYSTEM_DESIGN.md"), winslash = "/", mustWork = FALSE)
  expect_match(body, paste0("[design](file:///", target, ")"), fixed = TRUE)
  expect_match(body, "[web](https://example.org)", fixed = TRUE)
  expect_match(body, "[anchor](#objective)", fixed = TRUE)
  expect_match(body, "[mail](mailto:a@b.org)", fixed = TRUE)
})

test_that("the gen guard resets only <root>/site/gen; missing Quarto errors", {
  root <- make_root(withr::local_tempdir(), c(demo = ""))
  write_lines(file.path(root, "site", "_quarto.yml"), "project:")
  # A wrongly named folder next to _quarto.yml is refused and kept.
  wrong <- file.path(root, "site", "notgen")
  sentinel <- write_lines(file.path(wrong, "keep.txt"), "x")
  expect_error(ps$reset_gen_dir(wrong, root), "site/gen")
  expect_true(file.exists(sentinel))
  # A site/gen folder of another root is refused and kept.
  other <- make_root(withr::local_tempdir(), c(demo = ""))
  write_lines(file.path(other, "site", "_quarto.yml"), "project:")
  other_sentinel <- write_lines(file.path(other, "site", "gen", "keep.txt"), "x")
  expect_error(ps$reset_gen_dir(file.path(other, "site", "gen"), root), "site/gen")
  expect_true(file.exists(other_sentinel))
  # The right folder is emptied.
  old <- write_lines(file.path(root, "site", "gen", "old.md"), "x")
  ps$reset_gen_dir(file.path(root, "site", "gen"), root)
  expect_false(file.exists(old))
  expect_true(dir.exists(file.path(root, "site", "gen")))

  # A site folder that is a junction to another place is refused and kept.
  jroot <- make_root(withr::local_tempdir(), c(demo = ""))
  victim <- withr::local_tempdir()
  write_lines(file.path(victim, "_quarto.yml"), "project:")
  victim_file <- write_lines(file.path(victim, "gen", "important.txt"), "x")
  Sys.junction(victim, file.path(jroot, "site"))
  # Remove only the junction (rmdir does not follow it) before cleanup.
  withr::defer(system2(
    "cmd",
    c("/c", "rmdir", shQuote(gsub("/", "\\\\", file.path(jroot, "site")))),
    stdout = FALSE, stderr = FALSE
  ))
  expect_error(ps$reset_gen_dir(file.path(jroot, "site", "gen"), jroot), "site/gen")
  expect_true(file.exists(victim_file))

  expect_error(
    ps$build_site(root = root, quarto = file.path(root, "no-quarto.exe")),
    "Quarto not found"
  )
})

# ---- documentation check (Plan B) --------------------------------------------

test_that("extract_citations finds local, package and list citations", {
  lines <- c(
    "See `notes/a.md:1-2` and SYSTEM_DESIGN.md:3, also notes/a.md:1,3-4.",
    "Package: `pipdata/R/utils.R:490-500`. A time 13:40 is not a citation.",
    "URL https://example.org:8080/x is not one either."
  )
  cit <- ps$extract_citations(lines)
  expect_equal(
    cit$citation,
    c("notes/a.md:1-2", "SYSTEM_DESIGN.md:3", "notes/a.md:1,3-4", "pipdata/R/utils.R:490-500")
  )
  expect_equal(cit$line, c(1L, 1L, 1L, 2L))
})

make_doc_root <- function(doc_lines) {
  root <- make_root(
    withr::local_tempdir(.local_envir = parent.frame()),
    c(pipdata = "", other = "")
  )
  write_lines(file.path(root, "SYSTEM_DESIGN.md"), sprintf("line %d", 1:20))
  write_lines(file.path(root, "notes", "a.md"), sprintf("note %d", 1:5))
  write_lines(file.path(root, "docs", "d.md"), doc_lines)
  return(root)
}

good_doc <- c(
  "# Doc", "", "Fact (`SYSTEM_DESIGN.md:3`). Another (`notes/a.md:1,3-4`).",
  "Package fact (`pipdata/R/utils.R:490-500`).", "", "## Gaps", "", "- One gap."
)

test_that("check-doc passes a good doc and lists package citations", {
  root <- make_doc_root(good_doc)
  res <- ps$check_doc(file.path(root, "docs", "d.md"), root)
  expect_equal(nrow(res$problems), 0L)
  report <- paste(res$report, collapse = "\n")
  expect_match(report, "pipdata/R/utils.R:490-500", fixed = TRUE)
  heads <- grep("^## ", res$report, value = TRUE)
  expect_equal(heads, c("## Summary", "## Problems", "## Not checked", "## Gaps"))
})

test_that("check-doc reports each problem", {
  cases <- list(
    no_gaps = list(good_doc[1:4], "no ## Gaps section"),
    empty_gaps = list(c(good_doc[1:6], ""), "## Gaps section is empty"),
    too_far = list(c("Fact (`SYSTEM_DESIGN.md:21`).", good_doc[6:8]), "beyond the end"),
    missing = list(c("Fact (`notes/nope.md:1`).", good_doc[6:8]), "does not exist")
  )
  for (name in names(cases)) {
    root <- make_doc_root(cases[[name]][[1L]])
    res <- ps$check_doc(file.path(root, "docs", "d.md"), root)
    expect_equal(nrow(res$problems), 1L, label = name)
    expect_match(res$problems$problem, cases[[name]][[2L]], fixed = TRUE, label = name)
  }
  root <- make_doc_root(good_doc)
  outside <- withr::local_tempdir()
  write_lines(file.path(outside, "x.md"), good_doc)
  expect_error(ps$check_doc(file.path(outside, "x.md"), root), "inside pipsystem")
})

test_that("extract_citations keeps whole line lists and Windows paths", {
  cit <- ps$extract_citations(c(
    "A `notes/a.md:1, 999` and `notes/a.md:1-bad`.",
    "Win `E:/notes/a.md:9` and `E:\\notes\\a.md:9` and `notes\\a.md:2`.",
    "Prose: SYSTEM_DESIGN.md:3, also more text."
  ))
  expect_equal(
    cit$citation,
    c(
      "notes/a.md:1, 999", "notes/a.md:1-bad",
      "E:/notes/a.md:9", "E:\\notes\\a.md:9", "notes\\a.md:2",
      "SYSTEM_DESIGN.md:3"
    )
  )
})

test_that("check-doc reports partial, malformed and absolute citations", {
  doc <- c(
    "One `notes/a.md:1, 999`. Two `notes/a.md:1-bad`.",
    "Three `E:/notes/a.md:1`. Four `notes\\a.md:2`.",
    "", "## Gaps", "", "- gap"
  )
  root <- make_doc_root(doc)
  res <- ps$check_doc(file.path(root, "docs", "d.md"), root)
  expect_equal(nrow(res$problems), 3L)
  expect_true(any(grepl("beyond the end", res$problems$problem)))
  expect_true(any(grepl("not N, N-M", res$problems$problem)))
  expect_true(any(grepl("inside pipsystem", res$problems$problem)))
})

test_that("check_path refuses .., outside folders and junctions", {
  root <- withr::local_tempdir()
  dir.create(file.path(root, "docs"))
  expect_true(ps$check_path(file.path(root, "docs", "new.md"), root))
  expect_false(ps$check_path(file.path(root, "docs", "..", "..", "x.md"), root))
  expect_false(ps$check_path(withr::local_tempdir(), root))
  outside <- withr::local_tempdir()
  Sys.junction(outside, file.path(root, "docs", "link"))
  withr::defer(system2(
    "cmd",
    c("/c", "rmdir", shQuote(gsub("/", "\\\\", file.path(root, "docs", "link")))),
    stdout = FALSE, stderr = FALSE
  ))
  expect_false(ps$check_path(file.path(root, "docs", "link", "x.md"), root))
})

test_that("install_kilo copies the tracked definitions into .kilo", {
  root <- withr::local_tempdir()
  write_lines(file.path(root, "tools", "pipsys", "kilo", "commands", "pip-x.md"), "cmd")
  write_lines(file.path(root, "tools", "pipsys", "kilo", "agents", "pip-y.md"), "agent")
  write_lines(file.path(root, ".kilo", "commands", "pip-x.md"), "old")
  copied <- ps$install_kilo(root)
  expect_equal(sort(copied), c(".kilo/agents/pip-y.md", ".kilo/commands/pip-x.md"))
  expect_equal(readLines(file.path(root, ".kilo", "commands", "pip-x.md")), "cmd")
  expect_equal(readLines(file.path(root, ".kilo", "agents", "pip-y.md")), "agent")
})

test_that("backtick citations are taken whole, so bad suffixes are reported", {
  doc <- c(
    "A `notes/a.md:1, bad`. B `notes/a.md:1-`. C `notes/a.md:1-2-999`.",
    "D `/notes/a.md:9`. E `fread(file)` is code, not a citation.",
    "", "## Gaps", "", "- gap"
  )
  cit <- ps$extract_citations(doc)
  expect_equal(
    cit$citation,
    c("notes/a.md:1, bad", "notes/a.md:1-", "notes/a.md:1-2-999", "/notes/a.md:9")
  )
  root <- make_doc_root(doc)
  res <- ps$check_doc(file.path(root, "docs", "d.md"), root)
  expect_equal(nrow(res$problems), 4L)
  expect_equal(sum(grepl("not N, N-M", res$problems$problem)), 3L)
  expect_equal(sum(grepl("inside pipsystem", res$problems$problem)), 1L)
})
