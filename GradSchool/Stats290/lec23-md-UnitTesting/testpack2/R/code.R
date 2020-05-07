#' Check if two numbers are close enough per tolerance set by \code{testpack2_defaults$tol}
#'
#' @param x, first value
#' @param y, second value
#' @return TRUE or FALSE depending on \code{testpack2} package tolerance specification
#' @export
#' @examples
#' closeEnough(1.0001, 1.0002) ##TRUE per default tolerance of 1e-3
#' closeEnough(1.01, 1.02) ##FALSE per default tolerance of 1e-3
#' setDefaults("tol", 1e-1)
#' closeEnough(1.01, 1.02) ##TRUE per default tolerance of 1e-1
#'
closeEnough <- function(x, y) {
    ## check if two numbers are close enough
    abs(x - y) <= testpack2_defaults$tol
}

