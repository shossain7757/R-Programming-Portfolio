#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(shinythemes)

## Loading Dataset

DC <- read.csv(here::here("Portfolio Piece", "R Shiny", "dc-wikia-data.csv"))
Marvel <- read.csv(here::here("Portfolio Piece", "R Shiny", "marvel-wikia-data.csv"))

DC <- DC |>
  mutate(
    apps_code = case_when(APPEARANCES %in% 1000:4000 ~ 1,
                          APPEARANCES %in% 500:999 ~ 2,
                          APPEARANCES %in% 100:499 ~ 3,
                          APPEARANCES %in% 0:99 ~ 0),
    .after = APPEARANCES
  )


Marvel <- Marvel |>
  mutate(
    apps_code = case_when(APPEARANCES %in% 1000:4050 ~ 1,
                          APPEARANCES %in% 500:999 ~ 2,
                          APPEARANCES %in% 100:499 ~ 3,
                          APPEARANCES %in% 0:99 ~ 0),
    .after = APPEARANCES
  )

ui <- fluidPage(theme = shinytheme("flatly"),
  navbarPage( "Comic Characters",
    tabPanel("DC",          
    sidebarPanel(
      radioButtons(inputId = "gender",
                  label = "Gender",  
                  choices = c("Male Characters" = "Male Characters",
                              "Female Characters" = "Female Characters"), 
                  selected = "Male Characters"),
      br(),
      radioButtons(inputId = 'identity',
                   label = "Identity Status",
                   choices = c("Secret" = "Secret Identity",
                               "Public" = "Public Identity"),
                   selected = "Secret Identity"),
      br(),
      selectInput(inputId = 'apps',
                  label = "Appearance",
                  choices = c("> 1000" = 1,
                              ">500, <1000" = 2),
                  selected = 1)
      
      
    ),
    mainPanel("DC Character Appearances",
      plotOutput('barPlotDC')
    )
    ),
    tabPanel("Marvel",
             sidebarPanel(
               radioButtons(inputId = "gen",
                            label = "Gender",  
                            choices = c("Male Characters" = "Male Characters",
                                        "Female Characters" = "Female Characters"), 
                            selected = "Male Characters"),
               br(),
               radioButtons(inputId = 'iden',
                            label = "Identity Status",
                            choices = c("Secret" = "Secret Identity",
                                        "Public" = "Public Identity"),
                            selected = "Secret Identity"),
               br(),
               selectInput(inputId = 'appearance',
                           label = "Appearance",
                           choices = c("> 1000" = 1,
                                       ">500, <1000" = 2),
                           selected = 1)
             ),
             
             mainPanel("Marvel Character Appearances",
               plotOutput('barPlotMarvel')
             ))
  )
)

# Define server logic required to draw a barplot
server <- function(input, output) {

    output$barPlotDC <- renderPlot({
        ggplot(DC,
        aes( x = name, y = APPEARANCES)) +
        geom_bar( stat = 'Identity', data = filter(DC, SEX == input$gender &
                                                     ID == input$identity &
                                                   apps_code == input$apps),
                  width = 0.5)+
        coord_flip()+
        xlab("Character Names")
    })
    
    output$barPlotMarvel <- renderPlot({
      ggplot(Marvel,
             aes( x = name, y = APPEARANCES)) +
        geom_bar( stat = 'Identity', data = filter(Marvel, SEX == input$gen &
                                                     ID == input$iden,
                                                   apps_code == input$appearance),
                  width = 0.5)+
        coord_flip()+
        xlab("Character Names")
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
