#' List available R scripts
#'
#' Lists the reproducible R scripts distributed with Zonation5RData.
#'
#' @return A character vector containing the available script names,
#'   without the `.R` extension.
#'
#' @export
zonation5rdata_list_scripts <- function() {
  scripts_dir <- system.file("scripts", package = "Zonation5RData")
  
  scripts <- list.files(scripts_dir, pattern = "\\.R$")
  
  tools::file_path_sans_ext(scripts)
}