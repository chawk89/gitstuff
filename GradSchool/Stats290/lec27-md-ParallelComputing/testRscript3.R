#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 2) {
    ## We expect two arguments

    stop("Usage: testRscript3.R random_seed no_of_normals_to_print")
}
seed <- as.integer(args[1])
n <- as.integer(args[2])
set.seed(seed)
print(rnorm(n))
