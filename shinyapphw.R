library(tidyverse)
library(shiny)
library(ggplot2)

#1
ui <- fluidPage(
  titlePanel("Mtcars Histograms"),
  selectInput("var1", "mtcars variables", choices = names(mtcars)),
  plotOutput("plot")
)

server <- function(input, output) {
  output$plot <- renderPlot({ 
    ggplot(mtcars, aes(x = .data[[input$var1]], fill = "red")) +
      geom_histogram()
  })
}

shinyApp(ui = ui, server = server)

#2

mtcarsvar <- c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")

ui <- fluidPage(
  titlePanel("mtcarsdata"),
  verbatimTextOutput("summary"), 
  checkboxGroupInput("mtcarsvars", "For which mtcars variables is mean > median?", 
                     choices = mtcarsvar)
  
)
server1 <- function(input, output, ) {
  output$summary <- renderPrint({
    mtcars2 <- get(input$mtcars, "package:mtcars")
    summary(mtcars)
  })
  
  
  
}

shinyApp(ui = ui, server = server)

