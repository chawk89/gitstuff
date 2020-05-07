library(shiny)

ui <- fluidPage(
    h1("Example app 4"),
    sidebarLayout(
        sidebarPanel = sidebarPanel(
            numericInput(inputId = "nrows", label = "Number of rows", value = 10),
            actionButton(inputId = "save", label = "Save")
        ),
        mainPanel = mainPanel(
            plotOutput(outputId = "plot"),
            tableOutput(outputId = "table")
        )
    )
)

server <- function(input, output, session) {
    df <- reactive(x = {
        head(x = cars, n = input$nrows)
    })

    output$plot <- renderPlot(expr = {
        plot(x = df())
    })

    output$table <- renderTable(expr = {
        df()
    })

    ## Add logic so that when the "save" button is pressed, the data
    ## is saved to a CSV file called "data.csv" in the current
    ## directory.
    observeEvent(eventExpr = input$save, handlerExpr = {
        write.csv(df(), file = "data.csv")
    })
}

shinyApp(ui = ui, server = server)

