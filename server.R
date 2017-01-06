shinyServer(function(input, output) {

  react_title <- reactive({
    paste(input$indicators, "from", input$years[1], "to", input$years[2], "in", input$region)
  })


  output$text_page1 <- renderText({
    react_title()
  })
  
  data_to_use_page1 <- reactive({
    ifelse(input$region == "All Regions",
           data_to_use_page1 <- subset(ids_data_melted, ids_data_melted$Indicator.Name %in% input$indicators &
                                         ids_data_melted$Year >= input$years[1] &
                                         ids_data_melted$Year <= input$years[2]),
           data_to_use_page1 <- subset(ids_data_melted, ids_data_melted$Indicator.Name %in% input$indicators &
                                         ids_data_melted$Year >= input$years[1] &
                                         ids_data_melted$Year <= input$years[2] &
                                         ids_data_melted$Region %in% input$region))
    
    return(data_to_use_page1)
  })
  
  output$page1_line <- renderPlot({
    
    ggplot(data_to_use_page1(), aes(x = Year, y = value)) +
      stat_summary(geom = "line", fun.y = mean) +
      theme_bw()
    
    
    
  })
  
  
})
