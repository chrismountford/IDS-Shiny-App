shinyServer(function(input, output) {

  react_title <- reactive({
    paste(input$indicators, "from", input$years[1], "to", input$years[2], "in", input$region)
  })


  output$text_page1 <- renderText({
    react_title()
  })
  
})
