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
                    shinydashboard::box(title = "Specification",
                      selectInput(ns("AreaType"),
                                  "Please select an level.",
                                  choices = c("国家","省","市","区/县")
                                  ),
                      selectInput(ns("Province"),"Please select a Province", choices = NA),
                      actionButton(ns("confirmPlot"),"Confirm")
                    )
                    ),
             column(6,
                    tmap::tmapOutput(ns("mapPlot")),
                    plotOutput(ns("mapPlot_Static")))
                    #leaflet::leafletOutput(ns("mapPlot")))
             )
    
 
  )
}
    
#' ChinaGeo Server Function
#'
#' @noRd 
mod_ChinaGeo_server <- function(input, output, session, rv = rv){
  ns <- session$ns
  #browser()
  df =  readxl::read_xlsx("data/Province Name.xlsx")
  rv$df = df
  #browser()
  updateSelectInput(session, "Province", choices = df$Chi_Name)
  observeEvent(input$confirmPlot, {
    #shp_data = sf::st_read("data/gadm36_CHN_shp/gadm36_CHN_2.shp")
    if(input$AreaType  == "国家"){
      shp_data = China_Country
      tmap_options(max.categories = 31)
      tm = tmap::tm_shape(shp_data) + 
        tmap::tm_polygons("NAME_1") + 
        #tmap::tm_text("NL_NAME_1",size= 1) + 
        tmap::tm_layout(legend.show = FALSE)
    }else if(input$AreaType == "省"){
      shp_data = China_Province
      req(input$Province)
      library(dplyr)
      provinceID = dplyr::filter(rv$df, Chi_Name == input$Province) %>% pull(Eng_Name)
      #browser()
      p_guizhou = shp_data[shp_data$NAME_1 %in% c(provinceID),]
      
      p_guizhou$NAME_2 = p_guizhou$NAME_2 %>% as.character()
      tmap::tmap_mode("plot")
      tm = tmap::tm_shape(p_guizhou) +
        tmap::tm_polygons("NAME_2", title = "City", legend.show = FALSE) + 
        tmap::tm_text("NL_NAME_2",size= 1) + 
        tmap::tm_layout(legend.show = FALSE)
    }else{
      
    }
    
    #browser()
    output$mapPlot = tmap::renderTmap({
      tm
    })
    output$mapPlot_Static = renderPlot({
      tm 
    })
    
    
    #browser()
    
  })
  
  
  observe({
    if(input$AreaType == "国家"){
      shinyjs::hide("Province")
    }else if(input$AreaType == "省"){
      shinyjs::show("Province")
    }
  })
 
}
    
## To be copied in the UI
# mod_ChinaGeo_ui("ChinaGeo_ui_1")
    
## To be copied in the server
# callModule(mod_ChinaGeo_server, "ChinaGeo_ui_1")
 
