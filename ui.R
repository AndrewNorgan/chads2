library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("flatly"),
  
  # Application title
  titlePanel("CHADS2 Risk Calculator"),
  
  # Sidebar with risk scoring buttons
  sidebarLayout(
    sidebarPanel(
      print("Review patient clinical history and check boxes where indicated:"),
      checkboxInput("chf", "CHF history", value = FALSE, width = NULL),
      checkboxInput("htn", "Hypertensive history", value = FALSE, width = NULL),
      checkboxInput("age", "Age > 75", value = FALSE, width = NULL),
      checkboxInput("dm", "History of type 2 diabetes", value = FALSE, width = NULL),
      checkboxInput("stroke", "Stoke or TIA history", value = FALSE, width = NULL)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tableOutput("riskTable"),
       tableOutput("strokeRisk")
    )
  )
))
