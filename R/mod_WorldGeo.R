#' WorldGeo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_WorldGeo_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(ns("confirmPlot"),"Confirm"),
    plotOutput(ns("mapPlot_Static"))
 
  )
}
    
#' WorldGeo Server Function
#'
#' @noRd 
mod_WorldGeo_server <- function(input, output, session){
  ns <- session$ns
  observeEvent(input$confirmPlot, {
    data("World")
    tm = tm_shape(World) +
          tm_polygons("HPI")
    output$mapPlot_Static = renderPlot({
      tm 
    })
  })
 
}
    
## To be copied in the UI
# mod_WorldGeo_ui("WorldGeo_ui_1")
    
## To be copied in the server
# callModule(mod_WorldGeo_server, "WorldGeo_ui_1")
 
