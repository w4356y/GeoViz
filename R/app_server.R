#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  rv = reactiveValues()
  callModule(mod_ChinaGeo_server, "ChinaGeo_ui_1", rv = rv)
  callModule(mod_WorldGeo_server, "WorldGeo_ui_1")

}
