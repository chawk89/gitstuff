x <- data.frame(a1 = 1:3, b1 = letters[1:3], stringsAsFactors = FALSE)
z <- data.frame(a1 = 4:6, b2 = letters[4:6], stringsAsFactors = FALSE)
w <- x %+% z
`%+%` <- function(x, y) {
    if (!(is.data.frame(x) || is.data.frame(y)))
        stop("Error, expecting data frames for x and y")
    nx <- ncol(x) ; ny <- ncol(y)
    xNames <- names(x) ; yNames <- names(y)
    xTypes <- sapply(xNames, function(z) typeof(x[, z]))
    yTypes <- sapply(yNames, function(z) typeof(y[, z]))
    ##expectedTypes <- c("integer", "numeric", "character")
    expectedTypes <- c("integer", "double", "character")
    typesOK <- sapply(x, function(z) (typeof(z) %in% expectedTypes) && !is.factor(z))
    if (!all(typesOK)) {
        stop("%+%:  Unexpected types for data frame x columns")
    }
    typesOK <- sapply(y, function(z) (typeof(z) %in% expectedTypes) && !is.factor(z))
    if (!all(typesOK)) {
        stop("%+%:  Unexpected types for data frame y columns")
    }
    if (nx == 0)
        return(y)
    else if (ny == 0)
        return(x)
    if ((nx == ny) && all(xNames == yNames) && all(xTypes == yTypes)) {
        return(rbind(x, y))
    }
    if (nrow(x) == nrow(y)) {
        ## Have to watch out for x or y having duplicated variable names!
        result <- cbind(x, y)
        commonNames <- intersect(xNames, yNames)
        if (length(commonNames) > 0) {
 up names of x and y before cbind
            names(x)[match(commonNames, xNames)] <- paste(commonNames, "x", sep=".")
            names(y)[match(commonNames, yNames)] <- paste(commonNames, "y", sep=".")
        }
        return(cbind(x, y))
    }
    stop("%+%: Incompatible types for x and y")
}
