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

    ## Make both data and title eventReactive
    data <- eventReactive(input$go, {
        rnorm(input$normCount, input$normMean, input$normSd)
    })

    title <- eventReactive(input$go, {
        sprintf("Hist of %d N(%.2f, %.2f) normals",
                input$normCount, input$normMean, input$normSd)
    })

    output$plot <- renderPlot({
        d <- data()
        if (!is.null(d))
            hist(data(), main = title())
    })
}

shinyApp(ui, server)
