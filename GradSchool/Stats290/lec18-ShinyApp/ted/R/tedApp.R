#' Run the test shiny app
#' @description Runs a shiny app for a graphical user interface example
#' @export
#' @importFrom shiny runApp
tedApp <- function() {
    shiny::runApp(system.file('shinyApp', package = 'ted'))
}
