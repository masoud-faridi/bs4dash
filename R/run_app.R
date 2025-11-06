#' Run the Shiny Application
#'
#' @param ... arguments to pass to golem_opts.
#' See `?golem::get_golem_options` for more details.
#' @inheritParams shiny::shinyApp
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
run_app <- function(
  onStart = NULL,
  options = list(),
  enableBookmarking = NULL,
  uiPattern = "/",
  ...
) {


  source(app_sys("app/www/R_CODE/global.R"))


  ##################
  with_golem_options(
    app = shinyApp(
      ui = shinymanager::secure_app(app_ui,fab_position = "bottom-left",enable_admin = TRUE,
                                    head_auth = tags$style(
                                      "#password-pwd-mod {
                       direction: rtl;
                       display: block;
                       font-family: \"B Yekan\";
                  "
                                    ),
                                    tags_top = tags$div(
                                      tags$head(
                                        tags$style(
                                          "#auth-user_id-label, #auth-msg_auth,
                       .help-block, #auth-user_pwd-label {
                       direction: rtl;
                       display: block;
                       font-family: \"B Yekan\";
                       "
                                        )
                                        ,tags$style(
                                          "#auth-shinymanager-auth-head, #auth-go_auth {
                       font-family: \"B Yekan\";"
                                        )
                                      ),
                                      tags$img(
                                        src = "www/images/logo.jpg", width = "30%", alt="Logo not found", deleteFile=FALSE

                                      ))
                                    ,background =
                                      tags$head(tags$style(
                                        "#password-pwd_one-label{
                       direction: rtl;
                       display: block;
                     }"
                                      ) #Reza: add style to shiny manager

                                      )),
      server = app_server,
      onStart = onStart,
      options = options,
      enableBookmarking = enableBookmarking,
      uiPattern = uiPattern
    ),
    golem_opts = list(...)
  )
}
