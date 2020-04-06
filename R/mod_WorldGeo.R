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
    fluidRow(column(6,
                    shinydashboard::box(title = "Configuration", status = "primary", width = NULL,
                                        fluidRow(column(8, 
                                                        selectInput(ns("polygonParameter"),
                                                                    "Select a variable.", 
                                                                    choices = setdiff(colnames(World),c("iso_a3","geometry"))),
                                        ),
                                        column(4,
                                               actionButton(ns("confirmPlot"),"Confirm")
                                        )),
                                        radioButtons(ns("HighlightContinent"),"Select a continent",
                                                     choices = c("Asia",
                                                                 "Europe",
                                                                 "North America",
                                                                 "Africa",
                                                                 "South America"
                                                     ),
                                                     inline = TRUE),
                                        actionButton(ns("confirmHighlight"),"Zoom IN")
                                        )
                    ),
             column(6,
                    shinydashboard::box(title = "Filter", status = "primary", width = NULL,
                                        checkboxGroupInput(ns("Continent"),"Select a continent",
                                                     choices = c("Asia",
                                                                 "Europe",
                                                                 "North America",
                                                                 "Africa",
                                                                 "South America"
                                                     ),
                                                     inline = TRUE),
                                        actionButton(ns("confirmPlotAfterFilter"),"Confirm"))
                    )
             ),
    DT::dataTableOutput(ns("map_table")),
    plotOutput(ns("mapPlot_Static"))
    
    
    
 
  )
}
    
#' WorldGeo Server Function
#'
#' @noRd 
mod_WorldGeo_server <- function(input, output, session){
  ns <- session$ns
  World$name = World$name %>% as.character()
  World$sovereignt = World$sovereignt %>% as.character()
  observeEvent(input$confirmPlot, {
    #data("World")
    #browser()
    tm = tmap::tm_shape(World) +
          tmap::tm_polygons(input$polygonParameter)
    output$map_table = DT::renderDataTable({
      DT::datatable(World, extensions = 'Responsive',
                    options = list(pageLength = 8, autoWidth = TRUE),
                    rownames= FALSE)
    })
    output$mapPlot_Static = renderPlot({
      tm 
    })
  })
  
  observeEvent(input$confirmPlotAfterFilter, {
    #data("World")
    #browser()
    tm = tmap::tm_shape(World, filter = World$continent %in% input$Continent) +
      tmap::tm_polygons(input$polygonParameter)
    output$map_table = DT::renderDataTable({
      DT::datatable(World[World$continent == input$Continent,], extensions = 'Responsive',
                    options = list(pageLength = 8, autoWidth = TRUE),
                    rownames= FALSE)
    })
    output$mapPlot_Static = renderPlot({
      tm 
    })
  })
  
  observeEvent(input$confirmHighlight, {
    #data("World")
    #browser()
    tm = tmap::tm_shape(World[World$continent == input$HighlightContinent,]) +
      tmap::tm_polygons(input$polygonParameter)
    output$map_table = DT::renderDataTable({
      DT::datatable(World[World$continent == input$HighlightContinent,], extensions = 'Responsive',
                    options = list(pageLength = 8, autoWidth = TRUE),
                    rownames= FALSE)
    })
    output$mapPlot_Static = renderPlot({
      tm 
    })
  })
 
}
    
## To be copied in the UI
# mod_WorldGeo_ui("WorldGeo_ui_1")
    
## To be copied in the server
# callModule(mod_WorldGeo_server, "WorldGeo_ui_1")
 
