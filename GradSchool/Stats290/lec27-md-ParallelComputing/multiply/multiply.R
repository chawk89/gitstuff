#!/usr/bin/env Rscript

## Start of problem independent section
args <- commandArgs(trailingOnly = TRUE)
paramFile <- args[1]
paramRowIndex <- as.integer(args[2])
params <- read.csv(paramFile, header = TRUE, stringsAsFactors = FALSE)
p <- params[paramRowIndex, ]
## End of problem independent section

## Start of problem dependent section
p1 <- p[, 1] ## parameter 1
p2 <- p[, 2] ## parameter 2

result <- p1 * p2
print(sprintf("Finished %.2f * %.2f", p1, p2))

## Save variables you need for post-mortem analysis
## Make sure to use multiply as shown
saveRDS(result, file = sprintf("multiply-%d.RDS", paramRowIndex))

## End of problem dependent section

