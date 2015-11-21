library(shiny)
shinyUI(fluidPage(
  titlePanel("BMI Calculator"),
  titlePanel(h4("Author: Alecia Alianell")),
  
  sidebarPanel(
    h3("Documentation"),
    p(h4("Simple BMI Calculator in Standard Measurements:")),
    helpText("This application calculates the BMI of a person for given height and weight. To calculate your BMI, enter your height in inches and weight in pounds into the form below."),
    p(h3("What is BMI?")),
    helpText("BMI stands for Body Mass Index. The BMI shows the relation between a person's height and weight, and can be used to indicate whether the person is underweight, normal weight, overweight, or obese.
             A high BMI can be an indicator of high body fatness. BMI can be used as a screening tool but is not diagnostic of the body fatness or health of an individual. To determine if a high BMI is a health risk, a healthcare provider would need to perform further assessments. These assessments might include skinfold thickness measurements, 
             evaluations of diet, physical activity, family history, and other appropriate health screenings"),
    br(),
    helpText("Example of height in inches: If your height is 5 feet 7 inches, then you will multiply the feet by 12. Enter 5*12=60 inches + 7 inches = 67 inches"),
    HTML("<u><b>Equation for calculation: </b></u>
         <br> <br>
         <b> BMI = 703*[W /(H*H)] </b>
         <br>
         where: <br>
         BMI = Body Mass Index <br>
         W = Weight in lb <br>
         H = Height in in <br> ") 
    
    ),
  mainPanel(
  sidebarLayout(
    sidebarPanel( 
      h3("BMI Calculator"),
      helpText("This app calculates BMI - Body Mass Index based on your height (in) and weight (lb)."),            
      br(),           
      numericInput("num_height",label = h4("Enter your height (in inches)"),min = 5, max = 500,0), #,value = 150
      br(),
      numericInput("num_weight",label = h4("Enter your weight (in pounds)"),min = 5, max = 500,0), #, value = 50
      br(),
      
      br(),   
      actionButton("Calculate", label = "Calculate BMI")    
      
      
    ),
   
      sidebarPanel(
        h3("BMI Calculator Results",
                 p(h4("You entered:")),
                 textOutput("text_height"),
                 textOutput("text_weight"),
                 br(),
                 p(h4("Your BMI is:")),
                 textOutput("text_BMI"),
                 p(h4("Based on your BMI you are considered:")),
                 uiOutput("text_class"),
                 br()
                
                 
        )
        
      )
        
      
        )
      )
      ))