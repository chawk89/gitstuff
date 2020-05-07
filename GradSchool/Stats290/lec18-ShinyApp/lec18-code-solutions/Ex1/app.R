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
        plot(head(x = cars, n = input$nrows))
    })
    ## Fill in the code for the table output
    output$table <- renderTable({
        head(cars, input$nrows)
    })
}

shinyApp(ui, server)

