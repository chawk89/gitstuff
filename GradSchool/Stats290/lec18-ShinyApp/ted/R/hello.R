#' Greet someone
#' @description Greets anyone at the console
#' @param who the person or entity to greet
#' @export
hello <- function(who = 'world') {
    cat('Hello, ', who, '\n')
}
