#' module_00_00 UI Function
#'
#' @description Test module with 3 buttons to push message/notification/task
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import shiny
#' @import bs4Dash
mod_module_00_00_ui <- function(id) {
  ns <- NS(id)
  fluidRow(
    column(4,
           actionButton(ns("btn_msg"), "Push Message", class = "btn-primary btn-block")
    ),
    column(4,
           actionButton(ns("btn_notif"), "Push Notification", class = "btn-info btn-block")
    ),
    column(4,
           actionButton(ns("btn_task"), "Push Task", class = "btn-success btn-block")
    )
  )
}

#' module_00_00 Server Functions
#'
#' @param id Module ID
#' @param messageModule Returned object from messageServer()
#' @param notificationModule Returned object from notificationServer()
#' @param taskModule Returned object from taskServer()
#'
#' @noRd
mod_module_00_00_server <- function(id, messageModule, notificationModule, taskModule) {
  moduleServer(id, function(input, output, session) {



    #####################################################
    #####################################################

    observeEvent(input$btn_msg, {
      messageModule$push(
        messageItem(
          from = "تست ماژول",
          message = sprintf("پیام جدید در %s", format(Sys.time(), "%H:%M:%S")),
          time = "لحظاتی پیش",
          color = "teal",
          image = "https://adminlte.io/themes/v3/dist/img/user1-128x128.jpg"
        )
      )
    })

    # observeEvent(input$btn_notif, {
    #   notificationModule$push(
    #     notificationItem(
    #       text = sprintf("اعلان جدید در %s", format(Sys.time(), "%H:%M:%S")),
    #       status = "danger"
    #     )
    #   )
    # })
    #
    # observeEvent(input$btn_task, {
    #   taskModule$push(
    #     taskItem(
    #       text = sprintf("وظیفه جدید در %s", format(Sys.time(), "%H:%M:%S")),
    #       value = sample(10:90, 1),
    #       color = "orange"
    #     )
    #   )
    # })




    #####################################################
    #####################################################
  })
}

## نحوه استفاده در اپ اصلی

# در UI (مثلاً داخل dashboardBody یا tabItem)
# mod_module_00_00_ui("demo")

# در Server
# mod_module_00_00_server(
#   "demo",
#   messageModule = messageModule,
#   notificationModule = notificationModule,
#   taskModule = taskModule
# )
