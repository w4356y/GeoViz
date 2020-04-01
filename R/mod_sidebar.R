#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sidebar_ui <- function(id){
  ns <- NS(id)
  shinydashboard::dashboardSidebar(
    #disable = TRUE, 
    collapsed = FALSE,
    shinydashboard::sidebarMenu(
      id = 'tabs', 
      icon = icon("home"),
      shinydashboard::menuItem(
        "Dashboard", 
        tabName = "dashboard", 
        icon = icon("home")
      ),
      shinydashboard::menuItem(
        "BioMeta", 
        tabName = "China_Map", 
        icon = icon("moon")
      )
      ),
    tags$div(
      "Some text followed by a break", 
      tags$br(),
      "Some text following a break"
    ),
    tags$em("This text is emphasized."),
    tags$ol(
      tags$li("First list item"), 
      tags$li("Second list item"), 
      tags$li("Third list item")
    ),
    tags$pre("This text is preformatted."),
    tags$div(
      HTML(paste("This text is ", tags$span(style="color:red", "red"), sep = ""))
    )
    )
  
 
}
    
#' sidebar Server Function
#'
#' @noRd 
mod_sidebar_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_sidebar_ui("sidebar_ui_1")
    
## To be copied in the server
# callModule(mod_sidebar_server, "sidebar_ui_1")
 
