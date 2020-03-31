#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    # List the first level UI elements here 
    shinydashboardPlus::dashboardPagePlus(
      title = "China Map - Hello",
      skin = 'purple',
      #sidebar_background = 'grey',
      header = mod_header_ui("header_ui_1"),
      sidebar = mod_sidebar_ui("sidebar_ui_1"),
      body =   shinydashboard::dashboardBody(
        #useShinyjs(),
        #useShinyjs(),
        #title = "TEST",
        tags$head(
          tags$link(rel = "stylesheet", type = "text/css", href = "inst/app/www/custom.css"),
          tags$link(rel = "shiny::icon", type = "image", href = paste0(
            "http://www.promidat.org/theme/image.php/", 
            "formal_white/theme/1438713216/favicon")),
          useShinyjs(),
          tags$script(src = "myscript.js")
        ),
          
        shinydashboard::tabItems(
          shinydashboard::tabItem(
            tabName = "dashboard",
            actionButton("test","Test")
          ),
          shinydashboard::tabItem(
            tabName = "China Map",
            mod_ChinaGeo_ui("ChinaGeo_ui_1")
          )
        )
      )
    )
    
    # fluidPage(
    #   h1("GeoViz"),
    #   mod_ChinaGeo_ui("ChinaGeo_ui_1")
    # )
    
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'GeoViz'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

