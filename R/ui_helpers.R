
labelInput <- function(inputId, value = ""){
  tags$span(`data-id` = inputId, value)
}

# menu.idioma <- function() {
#   tags$li(
#     class = "nodisabled treeview", 
#     tags$a(
#       href = "#shiny-tab-tabdioma", 
#       tags$i(class="fa fa-language"),
#       labelInput("idioma"),
#       tags$i(class="fa fa-angle-left pull-right")),
#     tags$ul(
#       class="treeview-menu", style="display: none;", `data-expanded`="Idioma",
#       radioButtons('idioma', labelInput("selidioma"), 
#                    c('Español'='es', 'English'='en')),
#       tags$br()))
# }


siderbar_ui <- function(){
  shinydashboard::dashboardSidebar(
    shinydashboard::sidebarMenu(
      id = "principal",
      tags$div(style="padding-top:10px;"),
      shinydashboard::menuItem(labelInput("data"), tabName = "cargar",
                               icon = shiny::icon("dashboard")),
      shinydashboard::menuItem(
        labelInput("basico"), tabName = "parte1", 
        icon = shiny::icon("th-list"),
        shinydashboard::menuSubItem(
          labelInput("resumen"), tabName = "resumen", 
          icon = shiny::icon("sort-numeric-asc")),
        shinydashboard::menuSubItem(
          labelInput("normalidad"), tabName = "normalidad",
          icon = shiny::icon("bar-chart")),
        shinydashboard::menuSubItem(
          labelInput("dispersion"), tabName = "dispersion", 
          icon = shiny::icon("line-chart")),
        shinydashboard::menuSubItem(
          labelInput("distribucion"), tabName = "distribucion",
          icon = shiny::icon("area-chart")),
        shinydashboard::menuSubItem(
          labelInput("correlacion"), tabName = "correlacion",
          icon = shiny::icon("table"))
      ),
      shinydashboard::menuItem(
        labelInput("acp"), tabName = "acp", 
        icon = shiny::icon("pie-chart")),
      shinydashboard::menuItem(
        labelInput("jerarquico"), tabName = "agrupacion", 
        icon = shiny::icon("sitemap")),
      shinydashboard::menuItem(
        labelInput("kmedias"), tabName = "kmedias", 
        icon = shiny::icon("object-group")),
      shinydashboard::menuItem(
        labelInput("reporte"), tabName = "reporte",
        icon = shiny::icon("save-file", lib = "glyphicon")),
      shinydashboard::menuItem(
        labelInput("acercade"), tabName = "acercaDe",
        icon = shiny::icon("info")),
      shiny::hr(), 
      #menu.idioma(),
      tags$div(style = "display:none;",
               shiny::sliderInput(inputId = "aux", min = 2, value = 2,
                                  label = "Cantidad de Clusters", max = 10),
               colourpicker::colourInput(
                 "auxColor", NULL, value = "red", allowTransparent = T)
      )
    )
  )
  
}


body_ui <- function(){
  
  shinydashboard::dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style_promidat.css"),
      tags$link(rel = "shiny::icon", type = "image", href = paste0(
        "http://www.promidat.org/theme/image.php/", 
        "formal_white/theme/1438713216/favicon")),
      useShinyjs(),
      tags$script(src = "myscript.js")
    ),
    shiny::conditionalPanel(
      condition="($('html').hasClass('shiny-busy'))",
      div(id = "loaderWrapper", div(id = "loader"))
    )
  )
  
}