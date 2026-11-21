#' Open an example ZonationR script
#'
#' Opens an example R script included in Zonation5RData for inspection,
#' editing, and execution by the user.
#'
#' In RStudio, the script opens as a new, unsaved document. Outside RStudio,
#' a temporary copy is opened in the default R editor.
#'
#'
#' @param name Character string. Name of the script to open, without
#'   the `.R` extension. Use [zonation5rdata_list_scripts()] to see
#'   available scripts.
#'
#' @return Invisibly returns the path to the original script included
#'   in the package.
#'
#' @examples
#' \dontrun{
#' zonation5rdata_list_scripts()
#' zonation5rdata_get_script("administrative_units")
#' }
#'
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
  
  if (requireNamespace("rstudioapi", quietly = TRUE) &&
      rstudioapi::isAvailable()) {
    
    # Open a new, unsaved document in RStudio.
    rstudioapi::documentNew(
      text = paste(readLines(path, warn = FALSE), collapse = "\n"),
      type = "r"
    )
    
  } else {
    
    # Outside RStudio, open a temporary copy in the default R editor.
    copy <- tempfile(
      pattern = paste0(name, "_"),
      fileext = ".R"
    )
    
    if (!file.copy(path, copy)) {
      stop(
        "Could not create a temporary script copy.",
        call. = FALSE
      )
    }
    
    utils::file.edit(copy)
  }
  
  invisible(path)
}
