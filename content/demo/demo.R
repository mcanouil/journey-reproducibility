# cd .\mc-journey-reproducibility\resources\demo\

unlink(renv::paths$root(), recursive = TRUE)
unlink("renv", recursive = TRUE)
unlink("renv.lock", recursive = TRUE)
unlink("_dependencies.R", recursive = TRUE)


library(renv)
library(fs)
fs::dir_tree()

renv::init()
fs::dir_tree(recurse = 4)



library(renv)

Sys.setenv(RENV_DOWNLOAD_FILE_METHOD = "libcurl")
renv::equip()

renv::snapshot()

## Install R packages
# From CRAN/MRAN
renv::install("rlang") # install.packages("rlang")
packageVersion("rlang")

# An old version
renv::install("rlang@0.4.9")
packageVersion("rlang")

# From Github
renv::install("r-lib/rlang")
packageVersion("rlang")

# From Bioconductor
renv::install("bioc::Biobase")


## Record packages
renv::status()

writeLines("library(rlang)", "_dependencies.R")
renv::status()

renv::snapshot()

renv::remove("Biobase")
renv::snapshot()

## Use system R packages or not
renv::activate()
renv::deactivate()


# Remove renv architecture
unlink("renv/library", recursive = TRUE)
fs::dir_tree(recurse = 4)

renv::restore()
renv::isolate()
