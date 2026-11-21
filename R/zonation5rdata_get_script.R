#' Open an R script
#'
#' Opens a reproducible R script distributed with Zonation5RData
#' in the user's editor.
#'
#' @param name Name of the script, without the `.R` extension.
#'
#' @return Invisibly returns the path to the script.
#' @export
zonation5rdata_get_script <- function(name) {
  scripts <- zonation5rdata_list_scripts()
  
  if (!is.character(name) || length(name) != 1L ||
      is.na(name) || !name %in% scripts) {
    stop(
      "Script not found. Use zonation5rdata_list_scripts() to see available scripts.",
      call. = FALSE
    )
  }
  
  path <- system.file(
    "scripts",
    paste0(name, ".R"),
    package = "Zonation5RData",
    mustWork = TRUE
  )
  
  utils::file.edit(path)
  
  invisible(path)
}