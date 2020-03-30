#' ChinaGeo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ChinaGeo_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' ChinaGeo Server Function
#'
#' @noRd 
mod_ChinaGeo_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_ChinaGeo_ui("ChinaGeo_ui_1")
    
## To be copied in the server
# callModule(mod_ChinaGeo_server, "ChinaGeo_ui_1")
 
