# Practical session: kNN regression
## Jean-Philippe.Vert@mines.org
##
## In this practical session we:
##   - implement a simple version of regression with k nearest neighbors (kNN)
##   - implement cross-validation for kNN
##   - measure the training, test and cross-validation error as a function of k on the prostate cancer dataset
##

####################################
## Functions for k-nearest neighbors
####################################

knn <- function(klist, x.train, y.train, x.test) {
    ## k-nearest neighbors classification
    ##
    ## klist is a list of values of k to be tested
    ## x.train, y.train: the training set
    ## x.test: the test set
    ## Output: a matrix of predictions for the test set (one column for each k in klist)
    ## Number of training and test examples
    n.train <- nrow(x.train)
    n.test <- nrow(x.test)

    ## Matrix to store predictions
    p.test <- matrix(NA, n.test, length(klist))

    ## Vector to store the distances of a point to the training points
    dsq <- numeric(n.train)

    ## Loop on the test instances
    for (tst in 1:n.test) {
        ## Compute distances to training instances
        for (trn in 1:n.train) {
            dsq[trn] <- sum((x.train[trn, ] - x.test[tst, ])^2)
        }

        ## Sort distances from smallest to largest
        ord <- order(dsq)

        ## Make prediction by averaging the k nearest neighbors
        for (ik in 1:length(klist)) {
            p.test[tst, ik] <- mean(y.train[ord[1:klist[ik]]])
        }
    }

    ## Return the matrix of predictions
    invisible(p.test)
}

knn.cv <- function(klist, x.train, y.train, nfolds) {
    ## Cross-validation for kNN
    ##
    ## Perform nfolds-cross validation of kNN, for the values of k in klist

    ## Number of instances
    n.train <- nrow(x.train)

    ## Matrix to store predictions
    p.cv <- matrix(NA, n.train, length(klist))

    ## Prepare the folds
    s <- split(sample(n.train),rep(1:nfolds,length=n.train))

    ## Cross-validation
    for (i in seq(nfolds)) {
        p.cv[s[[i]], ] <- knn(klist, x.train[-s[[i]], ], y.train[-s[[i]]], x.train[s[[i]], ])
    }

    ## Return matrix of CV predictions
    invisible(p.cv)
}



new.knn.cv <- function(klist, x.train, y.train, nfolds) {
    ## Cross-validation for kNN
    ##
    ## Perform nfolds-cross validation of kNN, for the values of k in klist

    ## Number of instances
    n.train <- nrow(x.train)

    ## Matrix to store predictions
    p.cv <- matrix(NA, n.train, length(klist))

    ## Prepare the folds
    s <- split(sample(n.train),rep(1:nfolds,length=n.train))

    ## Cross-validation
    ## for (i in seq(nfolds)) {
    ##     p.cv[s[[i]], ] <- knn(klist, x.train[-s[[i]], ], y.train[-s[[i]]], x.train[s[[i]], ])
    ## }

    ## Cross-validation
    p <- foreach::foreach (i = seq(nfolds)) %dopar%  {
        knn(klist, x.train[-s[[i]], ], y.train[-s[[i]]], x.train[s[[i]], ])
    }

    for (i in seq(nfolds)) {
        p.cv[s[[i]], ] <- p[[i]]
    }

    ## Return matrix of CV predictions
    invisible(p.cv)
}
