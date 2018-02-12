#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  result_table <- read_csv("result_tbl.csv")
   
  output$riskTable <- renderTable({
    score <- (as.numeric(input$chf) + as.numeric(input$htn) 
              + as.numeric(input$age) + as.numeric(input$dm) + if_else(input$stroke == TRUE, 2, 0))
    result <- result_table[result_table$score == score,]
  })
  
  output$strokeRisk <- renderTable(colnames = FALSE,{
     tmp <- if_else(input$stroke == TRUE, "While history of stroke provides 2 points, 
                                    most physicians consider these patients <high risk>, with   
                                    annaul risk of >8.5% (no coumadin)", "")
     data_frame(tmp)
  })
  
})
