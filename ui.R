shinyUI(
  navbarPage("Temp Name 1",
              sidebarLayout(
                sidebarPanel(
                sliderInput("years", "Select a Range of Years:",
                            min = min_year,
                            max = max_year,
                            value = c(min_year, max_year)),
                
              radioButtons("region", "Select a Region:",
                           choices = c("ALL", regions),
                           selected = "ALL"),
              
              selectInput("indicators", "Select an Indicator:",
                          choices = indicators, selected = indicators[1])
              
                ),
              mainPanel(
                
              )
              
              )
             )
)
