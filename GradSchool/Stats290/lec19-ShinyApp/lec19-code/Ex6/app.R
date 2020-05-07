library(shiny)

ui <- fluidPage(
    h1("Ex 6"),
    sidebarLayout(
        sidebarPanel(
            actionButton("rnorm", "Normal"),
            actionButton("runif", "Uniform")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)

server <- function(input, output, session) {
    ## When "rnorm" button is clicked, the plot should show a new
    ## batch of rnorm(100). When "runif" button is clicked, the plot
    ## should show a new batch of runif(100).

    ## Rewrite this code below to use `observe` rather than `observeEvent`.

    plotData <- reactiveValues(values = NULL)

    observeEvent(input$rnorm, {
        plotData$values <- rnorm(100)
    })

    observeEvent(input$runif, {
        plotData$values <- runif(100)
    })

    output$plot <- renderPlot({
        if (is.null(plotData$values)) return()
        hist(plotData$values)
    })
}

shinyApp(ui, server)
