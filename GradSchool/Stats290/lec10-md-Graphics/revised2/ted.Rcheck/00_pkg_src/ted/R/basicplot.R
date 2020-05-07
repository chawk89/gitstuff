#' A simple scatterplot using ggplot2
#'
#' @param x the abscissa values
#' @param y the ordinate values
#' @return a ggplot object
#'
#' @importFrom ggplot2 ggplot geom_point aes
#' @examples
#' simple_plot(mtcars$wt, mtcars$mpg)
#' @export simple_plot
simple_plot  <- function(x, y) {
    ggplot2::ggplot() +
        ggplot2::geom_point(mapping = ggplot2::aes(x = x, y = y))
}
