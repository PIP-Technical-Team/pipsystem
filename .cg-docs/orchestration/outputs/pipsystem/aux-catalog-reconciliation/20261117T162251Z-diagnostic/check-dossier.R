# Static evidence comparison only: no new shared reads or production payloads.
output <- normalizePath(Sys.getenv("AUX_DIAG_OUTPUT"), winslash = "/")
document <- readLines(file.path(output, "decision-dossier.md"))
measures <- c("PFW", "CPI", "PPP", "pop", "GDP", "PCE")
selected <- c("5a1af0d6edf7d639", "02e66e507fb7946a", "13aa439a44297b23",
              "44be5f221cdbd223", "9927e67693c42f7c", "6fde46585a733db2")
candidates <- c("dbd2ccf63260991d", "ae38185bd7ff383c", "c16e62d94f46e1bc",
                "c059b971f5fc70cc", "062e2d30b15b4661", "4d57e305a0e3c86e")
for (index in seq_along(measures)) {
  row <- document[startsWith(document, paste0("| ", measures[[index]], " |"))]
  stopifnot(length(row) == 1L,
            grepl(selected[[index]], row, fixed = TRUE),
            grepl(candidates[[index]], row, fixed = TRUE),
            grepl("Absent / absent", row, fixed = TRUE),
            grepl("public payload acceptance NOT RUN", row, fixed = TRUE),
            grepl("UNKNOWN / UNKNOWN / UNKNOWN", row, fixed = TRUE),
            grepl("Retained snapshot is unavailable.", row, fixed = TRUE))
  cat("PASS: dossier selected/candidate and authority distinction:",
      measures[[index]], "\n")
}
stopifnot(any(grepl("Recover intended missing snapshots", document, fixed = TRUE)),
          any(grepl("Select different retained versions", document, fixed = TRUE)))
cat("PASS: separate recovery and reselection routes; neither authorized\n")
