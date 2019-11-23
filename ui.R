#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Calculadora pago de impuestos"),
    
    # Sidebar with a slider input for number of bins
    verticalLayout(
        radioButtons("documento", "Tipo de documento:", c("Boleta honorarios" = 1, "Factura productos/servicios" = 2)),
        numericInput("venta", "Valor bruto venta:", 200, min = 0, max = 99999999),
        numericInput("compra", "Valor bruto compra:", 100, min = 0, max = 99999999),
        htmlOutput("debitofiscal"),
        htmlOutput("creditofiscal"),
        htmlOutput("pagoimpuestos")
    )
))
