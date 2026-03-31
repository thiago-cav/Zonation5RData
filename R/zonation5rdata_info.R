#' Zonation5RData Package Information
#'
#' Opens the package metadata (metadata.md) in a nicely rendered HTML view.
#' Includes layer descriptions, folder structure, and attribution information.
#'
#' @examples
#' \dontrun{
#' zonation5rdata_info()
#' }
#'
#' @export
zonation5rdata_info <- function() {
  # Path to metadata file in the package
  md_path <- system.file("extdata", "metadata.md", package = "Zonation5RData")
  
  if (!file.exists(md_path)) {
    stop("Metadata file not found. Check that the package is installed correctly.")
  }
  
  # Temporary HTML file
  tmp_html <- tempfile(fileext = ".html")
  
  # Render Markdown to HTML
  rmarkdown::render(
    input = md_path,
    output_file = tmp_html,
    quiet = TRUE
  )
  
  # Open in RStudio Viewer if available, else default browser
  if (rstudioapi::isAvailable()) {
    rstudioapi::viewer(tmp_html)
  } else {
    utils::browseURL(tmp_html)
  }
}