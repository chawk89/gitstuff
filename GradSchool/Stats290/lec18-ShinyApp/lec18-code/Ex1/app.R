library(shiny)

ui <- fluidPage(
    h1("Ex1"),
    sidebarLayout(
        sidebarPanel(
            numericInput("nrows", "Number of rows", 10)
        ),
        mainPanel(
            plotOutput("plot"),
            tableOutput("table")
        )
    )
)

server <- function(input, output, session) {
    ## Plot the first input$nrows columns of a
    ## data frame of your choosing, using head() and plot()
    output$plot <- renderPlot({
        plot(head(cars, input$nrows))
    })
    output$table <- renderTable({
        head(cars, input$nrows)
    })
}

shinyApp(ui, server)
