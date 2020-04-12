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
    #argonDash::argonDashPage(
      title = "PROMiDAT - discoveR",
      skin = 'purple',
      #tags$head(tags$script(src = "www/script.js")),
      #sidebar_background = 'grey',
      header = mod_header_ui("header_ui_1"),
      sidebar = mod_sidebar_ui("sidebar_ui_1"),
      body =   shinydashboard::dashboardBody(
        #useShinyjs(),
        #useShinyjs(),
        #title = "TEST",
        tags$head(
          tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css"),
          shinyjs::useShinyjs(),
          tags$script(src = "www/script.js")
        ),
        shinydashboard::tabItems(
          shinydashboard::tabItem(
            tabName = "dashboard",
            mod_dashboard_ui("dashboard_ui_1")
          ),
          shinydashboard::tabItem(
            tabName = "China_Map",
            mod_ChinaGeo_ui("ChinaGeo_ui_1")
          ),
          shinydashboard::tabItem(
            tabName = "World_Map",
            mod_WorldGeo_ui("WorldGeo_ui_1")
            #mod_ChinaGeo_ui("ChinaGeo_ui_1")
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

