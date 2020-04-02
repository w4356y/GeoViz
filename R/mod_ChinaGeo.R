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
    fluidRow(column(6,
                    selectInput("AreaType",
                                "Please select an level.",
                                choices = c("Country","Province","City","District")
                                ),
                    actionButton(ns("confirmPlot"),"Confirm")
                    ),
             column(6,
                    tmap::tmapOutput(ns("mapPlot")))
                    #leaflet::leafletOutput(ns("mapPlot")))
             )
    
 
  )
}
    
#' ChinaGeo Server Function
#'
#' @noRd 
mod_ChinaGeo_server <- function(input, output, session){
  ns <- session$ns
  #browser()
  observeEvent(input$confirmPlot, {
    
    shp_data = sf::st_read("data/gadm36_CHN_shp/gadm36_CHN_2.shp")
    p_guizhou = shp_data[shp_data$NAME_1 %in% c('Guizhou'),]
    p_guizhou$NAME_2 = p_guizhou$NAME_2 %>% as.character()
    
    #browser()
    output$mapPlot = tmap::renderTmap({
      tmap::tmap_mode("plot")
      tmap::tm_shape(p_guizhou) +
        tmap::tm_polygons("NAME_2", title = "City", legend.show = FALSE) + 
        tmap::tm_text("NL_NAME_2",size= 1) + 
        tmap::tm_layout(legend.show = FALSE)
    })
    
    
    #browser()
    
  })
 
}
    
## To be copied in the UI
# mod_ChinaGeo_ui("ChinaGeo_ui_1")
    
## To be copied in the server
# callModule(mod_ChinaGeo_server, "ChinaGeo_ui_1")
 
