## Put onload and onAttach functionality

.onAttach <- function(libname, pkgname) {
  msg <- paste0("\nThis is scpdata version ",
                packageVersion("scpdata"), ".\n",
                "Use 'scpdata()' to list available data sets.")
  packageStartupMessage(msg)  
}

.onLoad <- function(libname, pkgname) {
  ## exports each resource name (i.e., title) into a function
  fl <- system.file("extdata", "metadata.csv", package=pkgname)
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  createHubAccessors(pkgname, titles)
}