# cd .\mc-journey-reproducibility\resources\demo\

unlink(renv::paths$root(), recursive = TRUE)
unlink("renv", recursive = TRUE)
unlink("renv.lock", recursive = TRUE)
unlink("_dependencies.R", recursive = TRUE)


library(renv)
library(fs)
fs::dir_tree()

renv::init()
fs::dir_tree(recurse = 1)



library(renv)

Sys.setenv(RENV_DOWNLOAD_FILE_METHOD = "libcurl")
renv::equip()

## Install R packages
# From CRAN/MRAN
renv::install("data.table") # install.packages("data.table")
packageVersion("data.table")

# An old version
renv::install("data.table@1.12.0")
packageVersion("data.table")

# From Github
renv::install("Rdatatable/data.table")
packageVersion("data.table")

# From Bioconductor
renv::install("bioc::Biobase")


## Record packages
renv::status()

writeLines("library(data.table)", "_dependencies.R")
renv::status()

renv::snapshot()

renv::remove("Biobase")
renv::snapshot()

## Use system R packages or not
renv::activate()
renv::deactivate()


# Remove renv architecture
unlink("renv", recursive = TRUE)
renv::restore()
renv::isolate()
