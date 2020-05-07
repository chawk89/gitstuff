library(shiny)

ui <- fluidPage(
    h1("Example app 5a"),
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

    plotData <- reactiveValues(values = NULL,
                               label = NULL)

    observeEvent(eventExpr = input$rnorm, handlerExpr = {
        plotData$values <- rnorm(100)
        plotData$label <- "100 normals"
    })

    observeEvent(eventExpr = input$runif, handlerExpr = {
        plotData$values <- runif(100)
        plotData$label <- "100 uniforms"
    })

    output$plot <- renderPlot(expr = {
        if (is.null(plotData$values)) return()
        hist(x = plotData$values, main = plotData$label)
    })
}

shinyApp(ui = ui, server = server)

