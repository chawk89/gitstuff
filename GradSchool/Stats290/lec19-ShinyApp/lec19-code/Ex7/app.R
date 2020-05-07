library(shiny)

ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            numericInput("normCount", "Count", 100),
            numericInput("normMean", "Mean", 0),
            numericInput("normSd", "Std Dev", 1),
            actionButton("go", "Plot")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)

server <- function(input, output){
    output$plot <- renderPlot({
        ## Modify so that the plot is only replotted when
        ## the go button for "Plot" above is pressed.
        data <- rnorm(input$normCount, input$normMean, input$normSd)
        hist(data,
             main = sprintf("Hist of %d N(%f, %f) normals",
                            input$normCount, input$normMean, input$normSd))
    })
}

shinyApp(ui, server)
