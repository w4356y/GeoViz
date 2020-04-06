#' dashboard UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dashboard_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboard::box(title = "test",
                        selectInput("1","1",choices = c(1,2,3)),
                        actionButton(ns("test"),"test")),
    tags$img(src="www/under_construction.png", style = 'width: 100%;')
 
  )
}
    
#' dashboard Server Function
#'
#' @noRd 
mod_dashboard_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_dashboard_ui("dashboard_ui_1")
    
## To be copied in the server
# callModule(mod_dashboard_server, "dashboard_ui_1")
 
