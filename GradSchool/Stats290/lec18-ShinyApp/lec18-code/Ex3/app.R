library(shiny)

ui <- fluidPage(
  sidebarLayout(
      sidebarPanel = sidebarPanel(
          selectInput(inputId = "xcol", label = "X variable", choices = names(iris)),
          selectInput(inputId = "ycol", label = "Y variable", choices = names(iris), selected = names(iris)[2]),
          numericInput(inputId = "rows", label = "Rows to show", value = 10)
      ),
      mainPanel = mainPanel(
          tabsetPanel(
              tabPanel(title = "Data", br(),
                       tableOutput(outputId = "table")
                       ),
              tabPanel(title = "Summary", br(),
                       verbatimTextOutput(outputId = "dataInfo"),
                       verbatimTextOutput(outputId = "modelInfo")
                       ),
              tabPanel(title = "Plot", br(),
                       plotOutput(outputId = "plot")
                       )
          )
      )
  )
)

server <- function(input, output, session) {

    ## Remove duplication of `selected` and `model` code/calculations.

    output$plot <- renderPlot(expr = {
        selected <- head(x = iris[, c(input$xcol, input$ycol)], n = input$rows)
        model <- lm(formula = paste(input$ycol, "~", input$xcol), data = selected)
        plot(x = selected)
        abline(a = model)
    })

    output$modelInfo <- renderPrint(expr = {
        selected <- head(x = iris[, c(input$xcol, input$ycol)], n = input$rows)
        model <- lm(formula = paste(input$ycol, "~", input$xcol), data = selected)
        summary(object = model)
    })

    output$dataInfo <- renderPrint(expr = {
        selected <- head(x = iris[, c(input$xcol, input$ycol)], n = input$rows)
        summary(object = selected)
    })

    output$table <- renderTable(expr = {
        selected <- head(x = iris[, c(input$xcol, input$ycol)], n = input$rows)
        head(x = selected, n = input$rows)
    })
}

shinyApp(ui = ui, server = server)
