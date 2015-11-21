library(shiny)

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$Calculate
    values$bmi <- isolate({
      (input$num_weight/(input$num_height * input$num_height))*703
      
    })
  })

  
  # Display values entered
  output$text_height <- renderText({
    input$Calculate
    paste("Height [in] :", isolate(input$num_height))
  })
  
  output$text_weight <- renderText({
    input$Calculate
    paste("Weight [lb] : ", isolate(input$num_weight))
  })
  
  
  
  # Display calculated values
  
  output$text_BMI <- renderText({
    if(input$Calculate == 0) ""
    else
      
      paste("BMI:", round(values$bmi,2))
  })
  
  output$text_class <- renderText({
    if(input$Calculate == 0) ""
    else
    if (values$bmi<18.5) info=("UNDERWEIGHT") 
    else if (values$bmi>=18.5 & values$bmi<25) info=("HEALTHY WEIGHT")
    else if (values$bmi>=25 & values$bmi<30) info=("OVERWEIGHT")
    else if (values$bmi>=30) info=("OBESE")
    else info="NA"

    })
  

  
})