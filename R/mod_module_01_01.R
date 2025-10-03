#' module_01_01 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_module_01_01_ui <- function(id) {
  ns <- NS(id)
  tagList(

  )
}

#' module_01_01 Server Functions
#'
#' @noRd
mod_module_01_01_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_module_01_01_ui("module_01_01")

## To be copied in the server
# mod_module_01_01_server("module_01_01")
