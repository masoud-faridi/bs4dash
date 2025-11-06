# all_packages <- (.packages())
#
# # لیست پکیج‌های پیش‌فرض
# base_packages <- c("base", "stats", "graphics", "grDevices", "utils", "datasets", "methods")
#
# # فیلتر کردن پکیج‌های غیرپیش‌فرض
# loaded_packages <- all_packages[!all_packages %in% base_packages]
#
# # نمایش پکیج‌های لود شده
# print(loaded_packages)

usethis::use_package('dplyr')
usethis::use_package('shiny')
usethis::use_package('stringr')
usethis::use_package('tidyr')
usethis::use_package('openxlsx')
usethis::use_package('shinycssloaders')
usethis::use_package('plotly')
usethis::use_package('shinymanager')
usethis::use_package('bs4dash')
usethis::use_package('shinybusy')


library(dplyr)
library(shiny)
library(stringr)
library(tidyr)
library(openxlsx)
library(shinycssloaders)
library(plotly)
library(shinymanager)
library(bs4dash)
library(shinybusy)


