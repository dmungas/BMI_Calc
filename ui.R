shinyUI(pageWithSidebar(
  headerPanel("BMI Calculator"),
  sidebarPanel(
    p("Body mass index (BMI) is a simple index that is based on height and weight and 
      has been used as a measure of thinness and obesity. To calculate the BMI 
      associated with a specific height and weight: 1) select units of measurement 
      for height and weight (English versus Metric), 2) enter height (in 
      appropriate units) in dropdown menu, and 3) enter weight (in approriate units)
      in dropdown menu. The calculated BMI value will be displayed."),
    radioButtons("units", "Measurement Units", c("English","Metric"), selected = "English"),
    conditionalPanel(
      condition = "input.units == 'English'",
      selectInput(
        "ht", "Height (in inches)",
        c(NA,30:100), selected=NA),
      selectInput('wt', "Weight (in pounds)", 
        c(NA,50:500), selected = NA)
      ),
    conditionalPanel(
      condition = "input.units == 'Metric'",
      selectInput(
        "htm", "Height (in centimeters)",
        c(NA,75:250), selected=NA),
      selectInput('wtm', "Weight (in kilograms)", 
        c(NA,20:220), selected = NA)
    ),
   actionButton("resetButton","Reset")
  ),
  mainPanel(
#   Uncomment to output the inputted values for height and weight
#     conditionalPanel(
#       condition = "input.units == 'English'",
#           h4('Height (inches)'),
#           textOutput('ht'),
#           p(),
#           h4('Weight (pounds)'),
#           textOutput('wt')
#     ),
#     conditionalPanel(
#           condition ="input.units == 'Metric'",
#           h4('Height (centimeters)'),
#           textOutput('htm'),
#           p(),
#           h4('Weight (kiolgrams)'),
#           textOutput('wtm')
#     ),
#     p(),
    
    div(h2('BMI'), align="center"),
    p(),
    div(h3(textOutput('bmicalc')),align="center")
  )
))