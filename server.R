library(shiny)

shinyServer(
  function(input, output, session) {
    bmicalc <- reactive(
      round(ifelse(!input$ht=="NA" & !input$wt=="NA",
          as.numeric(input$wt)*703 / as.numeric(input$ht)^2,
          as.numeric(input$wtm) / ((as.numeric(input$htm)/100))^2)
        ,2)
    )
    output$ht <- renderText({input$ht})
    output$wt <- renderText({input$wt})
    output$htm <- renderText({input$htm})
    output$wtm <- renderText({input$wtm})
    output$bmicalc <- renderPrint({cat(bmicalc())})
    observeEvent(input$resetButton, {
      updateNumericInput(session, "ht", value = NA)
      updateNumericInput(session, "wt", value = NA)
      updateNumericInput(session, "htm", value = NA)
      updateNumericInput(session, "wtm", value = NA)
      }
    )
    observeEvent(input$units, {
      updateNumericInput(session, "ht", value = NA)
      updateNumericInput(session, "wt", value = NA)
      updateNumericInput(session, "htm", value = NA)
      updateNumericInput(session, "wtm", value = NA)
    }
    )
  }  
)
