shinyUI(
  navbarPage("Temp Name 1",
              sidebarLayout(
                sidebarPanel(
                sliderInput("years", "Select a Range of Years:",
                            min = min_year,
                            max = max_year,
                            value = c(min_year, max_year))
              ),
              
              mainPanel(
                
              )
              
              )
             )
)
