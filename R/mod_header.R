#' header UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_header_ui <- function(id){
  ns <- NS(id)
  shinydashboardPlus::dashboardHeaderPlus(title = tags$a(href="http://metanotitia.com/", 
                                                           target = "_blank",
                                                           shiny::img(src = "www/logo2.jpg", 
                                                                      height = 55, width = "100%",
                                                                      style="padding-top:2px; padding-bottom:6px;")
    ) 
  )
}
    
#' header Server Function
#'
#' @noRd 
mod_header_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_header_ui("header_ui_1")
    
## To be copied in the server
# callModule(mod_header_server, "header_ui_1")
 
