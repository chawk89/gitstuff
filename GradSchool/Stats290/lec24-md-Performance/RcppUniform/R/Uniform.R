#' A C++ Uniform class exposed via R6
#'
#' @description \code{Uniform} objects can be instantiated and drawn from.
#'
#' @docType class
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'   \item{\code{Uniform$new(min = 0.0, max = 1.0)}}{Create a new Uniform class}
#'   \item{\code{Uniform$draw(n = 1)}}{Draw n observations from the class}
#' }
#'
#' @export
#'
#' @examples
#' u <- Uniform$new()
#' u$draw(3)
#' u2 <- Uniform$new(1.0, 5.0)
#' u2$draw(5)
Uniform <-
    R6::R6Class(
            "Uniform",
            private = list(
                ## Pointer to the C++ class
                xptr = NULL
            ),
            public = list(
                #' Create a Uniform instance
                #' @param min the minimum value
                #' @param max the maximum value
                initialize = function(min = 0.0, max = 1.0) {
                    private$xptr <- Unew(min, max)
                },
                #' Draw n observations from uniform
                #' @param n the number of observations
                #' @return a vector of n observations
                draw = function(n = 1) {
                    Udraw(private$xptr, n)
                }
            ))
