#' A simple greeting function
#'
#' This function shows a standard text on the console. In a time-honoured
#' tradition, it defaults to displaying _hello, world_.
#'
#' @param txt the text to display, default `"world"`
#'
#' @examples
#'   hello()
#'   hello("and goodbye")
#' @export hello
hello <- function(txt = "world") {
    cat("Hello, ", txt, "\n")
}
