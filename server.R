#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    calculo_debitofiscal <- reactive({ 
            if (input$documento == 1) {
                input$venta * 0.1
            } else {
                input$venta * 0.19
            }
        })
    
    calculo_creditofiscal <- reactive({ 
        if (input$documento == 1) {
            0
        } else {
            input$compra * 0.19
        }
    })
    
    output$debitofiscal <- renderText({
        HTML(paste("<b>Débito fiscal:", calculo_debitofiscal(), "</b>"))
    })
    
    output$creditofiscal <- renderText({
        HTML(paste("<b>Crédito fiscal:", calculo_creditofiscal(), "</b>"))
    })
    
    output$pagoimpuestos <- renderText({
        HTML(paste("<b>Pagar a SII:", max(calculo_debitofiscal() - calculo_creditofiscal(), 0), "</b>"))
    })
})
