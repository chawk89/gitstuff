#' Function to set defaults
#' @param tol the tolerance, default 1e-3
#' @param max_iter the maximum number of iterations, default 25
#' @return a list of option values invisibly
#' @examples
#' setDefaults(tol = 1e-5)
#' getOption("testpack1_defaults")
#' @export
setDefaults <- function(tol = 1e-3, max_iter = 25) {
    result  <- as.list(environment())
    options(testpack1_defaults = result)
    invisible(result)
}

## When package is loaded, ensure that defaults are set
.onLoad  <- function(libname, pkgname) {
    setDefaults()
}

## When package is loaded, ensure that defaults are unset
.onUnload  <- function(libname, pkgname) {
    options(testpack1_defaults = NULL)
}
