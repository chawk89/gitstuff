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

    ## When "rnorm" button is clicked, the plot should show a new
    ## batch of rnorm(100). When "runif" button is clicked, the plot
    ## should show a new batch of runif(100).

    plotData <- reactiveValues(values = NULL)

    observeEvent(eventExpr = input$rnorm, handlerExpr = {
        plotData$values <- rnorm(100)
    })

    observeEvent(eventExpr = input$runif, handlerExpr = {
        plotData$values <- runif(100)
    })

    output$plot <- renderPlot(expr = {
        ## Account for the initial state of plotData
        if (is.null(plotData$values)) return()
        hist(x = plotData$values)
    })

}

shinyApp(ui = ui, server = server)

