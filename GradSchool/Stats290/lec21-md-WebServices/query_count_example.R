library(homomorpheR)
library(distcomp)
library(jsonlite)
library(httr)
set.seed(123)

## You need to start opencpu using profiles shown in the script directory and setup directories
## ~/distcomp/site1, ~/distcomp/site2 etc.

## Here we run the query for `age > 50 & sex == "M"`

## Three sites
nSites <- 3
siteData <- lapply(c(30, 30, 40), function(n) {
    data.frame(age = sample(10:90, size = n, replace = TRUE),
               gender = sample(c("M", "F"), size = n, replace = TRUE),
               fluid = runif(n = n, min = 25, max = 75))
})

qdef <- data.frame(compType = "QueryCount",
                   id = "QC",
                   projectName = "QCTest",
                   projectDesc = "QC Test Project",
                   he = TRUE,
                   filterCondition = 'age > 50 & gender == "M"',
                   stringsAsFactors = FALSE)
## At each worker site
sites  <- list(
    list(name = "Site1", url = "http://localhost:5656/ocpu"),
    list(name = "Site2", url = "http://localhost:5657/ocpu"),
    list(name = "Site3", url = "http://localhost:5658/ocpu")
)

workers_ok <- sapply(seq_len(nSites), function(i) {
    uploadNewComputation(site = sites[[i]], defn = qdef, data = siteData[[i]])
})

if (!all(workers_ok)) {
    stop("Not all worker sites set up!")
}

## Non-cooperating parties
ncp1_defn  <- data.frame(
    name = "NCP1",
    number = 1,
    id = "QC", #matching definition above
    projectName = "QCTest",
    projectDesc = "QC Test Project",
    stringsAsFactors = FALSE)

ncp2_defn  <- data.frame(
    name = "NCP2",
    number = 2,
    id = "QC", #matching definition above
    projectName = "QCTest",
    projectDesc = "QC Test Project",
    stringsAsFactors = FALSE)

ncp_sites  <- list(
    ncp1 = list(name = "NCP1", url = "http://localhost:8191/ocpu", defn = ncp1_defn),
    ncp2 = list(name = "NCP2", url = "http://localhost:8192/ocpu", defn = ncp2_defn)
)

ncp1_ok  <- uploadNewNCP(defn = ncp1_defn, comp_defn = qdef, url = ncp_sites$ncp1$url, sites = sites)
ncp2_ok  <- uploadNewNCP(defn = ncp2_defn, comp_defn = qdef, url = ncp_sites$ncp2$url, sites = sites)

if (!all(c(ncp1_ok, ncp2_ok))) {
    stop("Not all NCP sites set up!")
}

## Now comes the actual computation
## First we create a master
master <- makeHEMaster(qdef)

## Next we add the NCPs to the master
## The master only talks to each NCP
master$addNCP(ncp_defn = ncp1_defn, url = ncp_sites$ncp1$url)
master$addNCP(ncp_defn = ncp2_defn, url = ncp_sites$ncp2$url)

result  <- master$run()
cat("Distributed Count", result, "\n")

library(tidyverse)
all_data  <- do.call(rbind, siteData)
all_data %>%
    filter(age > 50 & gender == 'M') %>%
    summarize(count = n())



