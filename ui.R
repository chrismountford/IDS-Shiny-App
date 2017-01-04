shinyUI(
  navbarPage("Temp Name 1",
              sidebarLayout(
                sidebarPanel(
                sliderInput("years", "Select a Range of Years:",
                            min = min_year,
                            max = max_year,
                            value = c(min_year, max_year)),
                
              radioButtons("region", "Select a Region:",
                           choices = c("All Regions", regions),
                           selected = "All Regions"),
              
              selectInput("indicators", "Select an Indicator:",
                          choices = indicators, selected = indicators[1])
              
                ),
              mainPanel(
                textOutput("text_page1"),
                tags$head(tags$style("#text_page1{font-size: 20px;
                                                  font-style: bold;")),
                
                plotOutput("page1_line")
                
              )
              
              )
             )
)
