thematic_shiny()

# toast options
toastOpts <- list(
  autohide = TRUE,
  icon = "fas fa-home",
  close = FALSE,
  position = "bottomRight"
)

header = dashboardHeader(
  title = dashboardBrand(
    title = sprintf("bs4Dash v%s", as.character(utils::packageVersion("bs4Dash"))),
    color = "primary",
    href = "1",
    opacity = 0.8
  ),
  fixed = TRUE,
  tooltip(
    title = "This toggles the right sidebar",
    placement = "bottom",
    actionButton(inputId = "controlbarToggle", label = "Toggle Controlbar", class = "mx-2")
  ),
  popover(
    title = "Toggle button",
    content = "This toggle the left sidebar",
    placement = "bottom",
    actionButton(inputId = "sidebarToggle", label = "Toggle left sidebar", class = "mx-2")
  ),
  rightUi = tagList(
    dropdownMenu(
      badgeStatus = "danger",
      type = "messages",
      messageItem(
        inputId = "triggerAction1",
        message = "message 1",
        from = "Divad Nojnarg",
        image = "https://adminlte.io/themes/v3/dist/img/user3-128x128.jpg",
        time = "today",
        color = "lime"
      )
    ),
    userOutput("user")
  ),
  leftUi = tagList(
    dropdownMenu(
      badgeStatus = "info",
      type = "notifications",
      notificationItem(
        inputId = "triggerAction2",
        text = "Error!",
        status = "danger"
      )
    ),
    dropdownMenu(
      badgeStatus = "info",
      type = "tasks",
      taskItem(
        inputId = "triggerAction3",
        text = "My progress",
        color = "orange",
        value = 10
      )
    )
  )
)

sidebar = dashboardSidebar(
  fixed = TRUE,
  skin = "light",
  status = "primary",
  id = "sidebar",
  customArea = fluidRow(
    actionButton(
      inputId = "myAppButton",
      label = NULL,
      icon = icon("users"),
      width = NULL,
      status = "primary",
      style = "margin: auto",
      dashboardBadge(textOutput("btnVal"), color = "danger")
    )
  ),
  sidebarUserPanel(
    image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png",
    name = "Welcome Onboard!"
  ),
  sidebarMenu(
    id = "current_tab",
    flat = FALSE,
    compact = FALSE,
    childIndent = TRUE,
    sidebarHeader("sidebar01_"),
    menuItem(
      text = "Galleries",
      icon = icon("cubes"),
      startExpanded = FALSE,
      menuSubItem(text = HTML(paste("Gallery 01_01",dashboardBadge("new",position = "right",color = "danger"))),tabName = "mI_01_01", icon = icon("circle"))
      , menuSubItem(text = HTML(paste("Gallery 01_02",dashboardBadge("new",position = "right",color = "danger"))),tabName = "mI_01_02", icon = icon("circle"))


    )
    ,
    sidebarHeader("sidebar02_")
    ,menuItem(
      text = "Galleries",
      icon = icon("cubes"),
      startExpanded = FALSE,
      menuSubItem(text = HTML(paste("Gallery 02_01",dashboardBadge("new",position = "right",color = "danger"))),tabName = "mI_02_01", icon = icon("users")),
      menuSubItem(text = HTML(paste("Gallery 02_02",dashboardBadge("new",position = "right",color = "danger"))),tabName = "mI_02_02", icon = icon("users"))


    )
  )
)

body = dashboardBody(



 # tabItems(

    # "mI_01_01","mI_01_02","mI_02_01","mI_02_02"

    ###  tab 1

    # tabItem(tabName = "mI_01_01", mod_module_01_01_ui("module_01_01"))
    # ,tabItem(tabName = "mI_01_02", mod_module_01_02_ui("module_01_02"))
    #
    #
    # ###  tab 2
    #
    # , tabItem(tabName = "mI_02_01", mod_module_02_01_ui("module_02_01"))
    # , tabItem(tabName = "mI_02_02", mod_module_02_02_ui("module_02_02"))
    #




    ## END tabItems
  #)


)



#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import thematic
#' @import waiter
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    ############################
    tags$style(
      '
        .plot-zoom {
            position: absolute;
            border: none;
            background-color: transparent;
            bottom: 0;
            right: 0;

        }
        .full-screen {
            position: fixed;
            height: 98vh !important;
            width: 98vw !important;
            left: 0;
            top: 0;
            z-index: 9999;
            overflow: hidden;
        }
        '
    )
    ,
    tags$script(HTML(
      "
        function plotZoom(el){
            el = $(el);
            var parent = el.parent().parent();
            if(el.attr('data-full_screen') === 'false') {
                parent.addClass('full-screen').trigger('resize').fadeOut().fadeIn();
                el.attr('data-full_screen', 'true');
            } else {
                parent.removeClass('full-screen').trigger('resize').fadeOut().fadeIn();
                el.attr('data-full_screen', 'false');
            }
        }

        $(function(){
           $('.plotly-full-screen  .plotly.html-widget').append(
            `
            <div style='position: relative;'>
                <button onclick=plotZoom(this) class='plot-zoom' data-full_screen='false' title='Full screen'>
                    <i class='fa fa-expand-arrows-alt'></i>
                </button>
            </div>
            `);
        })
        "
    ))
    ,


    dashboardPage(
      preloader = list(html = tagList(spin_1(), "Loading ..."), color = "#343a40"),
      dark = TRUE,
      help = FALSE,
      fullscreen = TRUE,
      scrollToTop = TRUE,
      header = header,
      sidebar = sidebar,
      body = body,
      controlbar = dashboardControlbar(
        id = "controlbar",
        skin = "light",
        pinned = TRUE,
        overlay = FALSE,
        controlbarMenu(
          id = "controlbarMenu",
          type = "pills",
          controlbarItem(
            "Inputs",
            column(
              width = 12,
              align = "center",
              radioButtons(
                inputId = "dist",
                label = "Distribution type:",
                c(
                  "Normal" = "norm",
                  "Uniform" = "unif",
                  "Log-normal" = "lnorm",
                  "Exponential" = "exp"
                )
              )
            )
          ),
          controlbarItem(
            "Skin",
            skinSelector()
          )
        )
      ),
      footer = dashboardFooter(
        fixed = FALSE,
        left = a(
          href = "https://twitter.com/divadnojnarg",
          target = "_blank", "@DivadNojnarg"
        ),
        right = "2022"
      ),
      title = "bs4Dash Showcase"
    )

    ############################


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
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "bs4dash"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
