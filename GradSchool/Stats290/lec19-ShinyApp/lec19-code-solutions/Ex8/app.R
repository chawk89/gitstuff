library(shiny)

ui <- fillPage(
  plotOutput("plot", click = "click", height = "100%")
)


## Assignment: This app doesn't work! It's supposed to let
## the user click on the plot, and have a data point appear
## where the click occurs. But as written, the data point
## only appears for a moment before disappearing.
##
## This happens because each time the plot is re-rendered,
## the value of input$click is reset to NULL, and thus
## userPoint() becomes NULL as well.
##
## 1. Can you get a single user-added data point to stay?
##
## 2. Can you include not just the single most recent click, but ALL
## clicks made by the user?
##
## Hint: You'll need to replace reactive() with a combo
## of reactiveValues() and observeEvent().


server <- function(input, output, session) {

    userPoint <- reactiveValues(speed = NULL, dist = NULL)
    observeEvent(input$click, {
        userPoint$speed <- c(userPoint$speed, input$click$x)
        userPoint$dist <- c(userPoint$dist, input$click$y)
    })


  output$plot <- renderPlot({
      ## Before plotting, combine the original dataset with
      ## the user data. (rbind ignores NULL args.)
      d <- data.frame(speed = userPoint$speed, dist = userPoint$dist)
      df <- rbind(cars, d)
      plot(df, pch = 19)

      model <- lm(dist ~ speed, df)
      abline(model)
  })
}

shinyApp(ui, server)
