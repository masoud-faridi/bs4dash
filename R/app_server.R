#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinymanager
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  res_auth <- secure_server(
    check_credentials = check_credentials(
      db=app_sys("app/www/db/manager.sqlite"),

      passphrase = "12345678"#key_get("R-shinymanager-key", "obiwankenobi")
      # passphrase = "passphrase_wihtout_keyring"
    )
  )

  # Timeout
  observeEvent(input$timeOut, {
    print(paste0("Session (", session$token, ") timed out at: ", Sys.time()))
    showModal(modalDialog(
      title = "Timeout",
      paste("Session timeout due to", input$timeOut, "inactivity -", Sys.time()),
      footer = NULL
    ))
    session$close()
  })



  #messageModule = callModule(mod_msg_message_dropdownMenu_server, 'messageUI')
  # notificationModule = callModule(notificationServer, 'notificationUI')
  # messageModule = callModule(messageServer, 'messageUI')
  # taskItemModule = callModule(taskItemServer, 'taskItemUI')




  # con_pool<-postgresql_get_connection_pool(dsn_list_psql)
  #browser()

  ########
  # check the connection
  # if(!pool::dbIsValid(con_pool)){
  #   message("ERROR 0001: (app_server) con_pool is not valid")
  # }

  # onStop(function(){
  #   cat("closing the connection...")
  #   poolClose(con_pool)
  # })


  mod_module_01_01_server("module_01_01"
                          # ,con_pool
                          # other arguments to pass module

                          )


}
