unlink("D:/Profils/mcanouil/PROJECTS/renv_demo", recursive = TRUE)
unlink("D:/Profils/mcanouil/AppData/Local/renv", recursive = TRUE)

usethis::create_project("renv_demo")
library(renv)

## Init
scaffold()
unlink(c("renv", ".Rprofile", "renv.lock"), recursive = TRUE)

init()

## Install R packages
# From CRAN/MRAN
install("magrittr")
install.packages("magrittr")
# An old version
install("magrittr@1.0.0")
# From Github
install("tidyverse/magrittr")
# From Bioconductor
install("bioc::Biobase")

## Record packages
snapshot()

remove("Biobase")
snapshot()

## Use system R packages or not
activate()
deactivate()
