library(shiny)

ui <- fluidPage(
    h1("Example app 5"),
    sidebarLayout(
        sidebarPanel = sidebarPanel(
            actionButton(inputId = "rnorm", label = "Normal"),
            actionButton(inputId = "runif", label = "Uniform")
        ),
        mainPanel = mainPanel(
            plotOutput(outputId = "plot")
        )
    )
)

server <- function(input, output, session) {
    ## When "rnorm" button is clicked, the plot should show a new
    ## batch of rnorm(100). When "runif" button is clicked, the plot
    ## should show a new batch of runif(100).

    output$plot <- renderPlot(expr = {
        hist(x = rnorm(n = 100))
    })

}

shinyApp(ui = ui, server = server)
