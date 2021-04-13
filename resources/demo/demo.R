# cd .\mc-journey-reproducibility\resources\demo\

unlink(renv::paths$root(), recursive = TRUE)
unlink("renv", recursive = TRUE)
unlink("renv.lock", recursive = TRUE)
unlink("_dependencies.R", recursive = TRUE)


library(renv)
library(fs)
fs::dir_tree()
init()
fs::dir_tree(recurse = 1)



library(renv)

Sys.setenv(RENV_DOWNLOAD_FILE_METHOD = "libcurl")
equip()

## Install R packages
# From CRAN/MRAN
install("data.table") # install.packages("data.table")
packageVersion("data.table")

# An old version
install("data.table@1.12.0")
packageVersion("data.table")

# From Github
install("Rdatatable/data.table")
packageVersion("data.table")

# From Bioconductor
install("bioc::Biobase")


## Record packages
status()

writeLines("library(data.table)", "_dependencies.R")
status()

snapshot()

remove("Biobase")
snapshot()

## Use system R packages or not
activate()
deactivate()


# Remove renv architecture
unlink("renv", recursive = TRUE)
restore()
isolate()
