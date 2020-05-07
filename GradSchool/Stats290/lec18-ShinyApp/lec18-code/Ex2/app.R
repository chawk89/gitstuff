library(shiny)

ui <- fluidPage(
  h1("Ex2"),
  sidebarLayout(
      sidebarPanel = sidebarPanel(
          numericInput(inputId = "nrows", label = "Number of rows", value = 10)
      ),
      mainPanel = mainPanel(
          plotOutput(outputId = "plot"),
          tableOutput(outputId = "table")
      )
  )
)



server <- function(input, output, session) {
    ## Factor out the head(cars, input$nrows) so that the code isn't
    ## duplicated and the operation isn't performed twice for each
    ## change to input$nrows.
   
  d <- reative(x = {
    head(x = cars, n = input$nrows)
  })

    output$plot <- renderPlot(expr = {
        plot(x = d())
    })

    output$table <- renderTable(expr = {
        d()
    })
}

shinyApp(ui = ui, server = server)
