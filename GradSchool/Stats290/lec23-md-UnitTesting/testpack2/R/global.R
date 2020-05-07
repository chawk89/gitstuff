##
## Global variable for package testpack
##
testpack2_defaults  <- list(tol = 1e-3, max_iter = 25)

#' Function to set defaults
#' @param tol the tolerance, default 1e-3
#' @param max_iter the maximum number of iterations, default 25
#' @return a list of default values invisibly
#' @examples
#' (resetDefaults())
#' (resetDefaults(tol = 1e-5))
#' @export
resetDefaults <- function(tol = 1e-3, max_iter = 25) {
    testpack2_defaults  <- as.list(environment())
    invisible(testpack2_defaults)
}

#' Set the default param name to a value
#'
#' @param name the parameter name
#' @param value the value to assign
#' @return the new list of defaults invisibly
#' @examples
#' (setDefaults("tol", 1e-5))
#' (setDefaults("max_iter", 100))
#' @export
setDefaults <- function(name, value) {
    ## check if param name is known!
    if (!(name %in% names(testpack2_defaults))) {
        stop(sprintf("Bad parameter name %s", name))
    }
    testpack2_defaults[[name]]  <- value
    invisible(testpack2_defaults)
}
