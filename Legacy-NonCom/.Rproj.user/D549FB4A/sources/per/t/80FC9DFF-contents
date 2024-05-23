# 
# CFTC Non Commercial Futures & Options Weekly Reporting
# 
# Data is released every Friday from the prior Tuesday's close

library(shiny)
library(tidyverse)
library(gt) # Used for color conditioning tables

source("scripts/1_Leg_FAO_Import.R")
source("scripts/2_change_cftc_names.R")
source("scripts/3_filter_leg_fao.R")
source("scripts/4_functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Commitments of Traders"),
  
  # Inputs at the top
  fluidRow(
    column(4, 
           selectInput(inputId = "market",
                       label = "Market",
                       choices = LegFaoTEST$Market_and_Exchange_Names,
                       selected = "E-MINI S&P 500"
           )
    ),
    column(4, 
           dateInput(inputId = "start",
                     label = "Start Date",
                     value = "2020-01-01",
                     min = "1995-03-21",
                     max = Sys.Date(),
                     startview = "year"
           )
    ),
    column(4, 
           dateInput(inputId = "end",
                     label = "End Date",
                     value = Sys.Date(),
                     min = "1995-03-21",
                     max = Sys.Date(),
                     startview = "year"
           )
    )
  ),
  
  # Descriptive section for columns
  fluidRow(
    column(12,
           wellPanel(
             h4("Column Descriptions"),
             p(HTML("<strong>Date:</strong> Data at Tuesday market close, released Friday.")),
             p(HTML("<strong>OI All:</strong> Total open interest for all trader categories.")),
             p(HTML("<strong>Z:</strong> Z-score for each column relative to target dates selected by input")),
             p(HTML("<strong>Δ Week:</strong> Change from prior week.")),
             p(HTML("<strong>Net:</strong> The difference between the total long and short positions.")),
             p(HTML("<strong>Long/Short:</strong> Number of long and short positions respectively.")),
             p(HTML("<strong>% Long/Short:</strong> Percentage of total open interest that is long or short.")),
             p(HTML("<strong>Flip:</strong> Difference between the % Long and % Short columns. "))
           )
    )
  ),
  
  # Main panel to display the table
  fluidRow(
    column(12,
           gt_output(outputId = "gt_table")
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {

    output$"gt_table" <- render_gt(cot_noncom(input$market, input$start, input$end)
                                   )
}

# Run the application 
shinyApp(ui = ui, server = server)
