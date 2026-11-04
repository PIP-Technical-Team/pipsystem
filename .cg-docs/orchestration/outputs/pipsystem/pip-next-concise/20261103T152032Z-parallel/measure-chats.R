# Mechanical output measurements support, not replace, coordinator oracle review.
run <- ".cg-docs/orchestration/outputs/pipsystem/pip-next-concise/20261103T152032Z-parallel"
args <- commandArgs(trailingOnly = TRUE)
files <- if (length(args)) file.path(run, args) else {
  list.files(run, pattern = "^sampled-output.*\\.md$", full.names = TRUE)
}
rows <- list()
for (file in files) {
  lines <- readLines(file, warn = FALSE)
  starts <- grep("^#{1,3} CHAT$", lines)
  for (start in starts) {
    headings <- grep("^#{1,3} ", lines[seq_len(start - 1L)])
    case <- sub("^#+ (Case:? )?", "", lines[max(headings)])
    ends <- grep("^#{1,3} SIMULATED SAVED ASSESSMENT", lines)
    ends <- ends[ends > start]
    end <- if (length(ends)) min(ends) - 1L else length(lines)
    chat <- paste(lines[seq.int(start + 1L, end)], collapse = " ")
    words <- length(strsplit(trimws(chat), "[[:space:]]+")[[1]])
    rows[[length(rows) + 1L]] <- data.frame(
      file = basename(file), case = case, words = words,
      full_sha_in_chat = grepl("[a-f0-9]{40}", chat),
      gate_code_in_chat = grepl("\\bG-[A-Z]+", chat)
    )
  }
}
result <- do.call(rbind, rows)
write.table(result, file.path(run, "chat-measurements.tsv"), sep = "\t", row.names = FALSE, quote = FALSE)
print(result, row.names = FALSE)
if (length(args)) {
  ordinary <- result$case %in% c("global-ready", "concise-complete")
  stopifnot(any(ordinary))
  stopifnot(all(result$words[ordinary] >= 150L & result$words[ordinary] <= 250L))
  stopifnot(!any(result$full_sha_in_chat), !any(result$gate_code_in_chat))
  cat("Ordinary valid brief length and accepted detail-boundary assertions pass\n")
}
