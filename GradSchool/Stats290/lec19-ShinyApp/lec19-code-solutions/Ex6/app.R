library(shiny)

ui <- fluidPage(
    h1("Ex 6 Solution"),
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
    ## For normal values
    observe({
        ## Take dependency on the button
        input$rnorm
        plotData$values <- rnorm(100)
    }, priority = 10)
    ## For uniform values
    observe({
        ## Take dependency on the button
        input$runif
        plotData$values <- runif(100)
    }, priority = 10)
    output$plot <- renderPlot({
        if (is.null(plotData$values)) return()
        hist(plotData$values)
    })
}

shinyApp(ui, server)
