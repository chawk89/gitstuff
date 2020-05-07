library(shiny)
library(ggplot2)
ui <- fluidPage(
    h1("Ex 5"),
    sidebarLayout(
        sidebarPanel(
            actionButton("rnorm", "Normal"),
            actionButton("runif", "Uniform")
        ),
        mainPanel(
            h3(textOutput("annotation")),
            plotOutput("plot")
        )
    )
)

server <- function(input, output, session) {
    ## When "rnorm" button is clicked, the plot should show a new
    ## batch of rnorm(100). When "runif" button is clicked, the plot
    ## should show a new batch of runif(100).

    ## Rewrite this code below to use `observe` rather than `observeEvent`.

    plotData <- reactiveValues(values = NULL, type = NULL)

    observe({
        input$rnorm
        plotData$values <- rnorm(100)
        plotData$type <- "normals"
    })

    observe({
        input$runif
        plotData$values <- runif(100)
        plotData$type <- "uniforms"
    })

    observe({
        if (plotData$type == "normals") {
            plotData$text <- "Sample of 100 normals"
        } else {
            plotData$text <- "Sample of 100 uniforms"
        }
    })


    output$plot <- renderPlot({
        if (is.null(plotData$values)) return()
        p <- ggplot() +
            geom_histogram(mapping = aes(x = plotData$values),
                           bins = 30,
                           color = I("red"))
        print(p)
    })

    output$annotation <- renderText({
        plotData$text
    })

}

shinyApp(ui, server)
