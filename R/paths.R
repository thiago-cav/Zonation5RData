# Path helpers for inst/extdata — see Wickham & Bryan, R Packages 2e, ch. Data
# https://r-pkgs.org/data.html#sec-data-extdata

zonation5rdata_path <- function(..., must_work = FALSE) {
  system.file("extdata", ..., package = "Zonation5RData", mustWork = must_work)
}

zonation5rdata_root <- function(must_work = TRUE) {
  system.file("extdata", package = "Zonation5RData", mustWork = must_work)
}

# zonation5rdata_example — see man/zonation5rdata_example.Rd and r-pkgs.org/data.html

zonation5rdata_example <- function(path = NULL) {
  root <- system.file("extdata", package = "Zonation5RData", mustWork = TRUE)
  if (is.null(path)) {
    return(sort(dir(root)))
  }
  parts <- if (length(path) > 1L) {
    path
  } else {
    unlist(strsplit(path, "/", fixed = TRUE), use.names = FALSE)
  }
  do.call(
    system.file,
    c(list("extdata"), as.list(parts), list(package = "Zonation5RData", mustWork = TRUE))
  )
}

zonation5rdata_list <- function(..., recursive = TRUE, full.names = FALSE,
                                include.dirs = FALSE) {
  root <- system.file("extdata", package = "Zonation5RData", mustWork = TRUE)
  parts <- list(...)
  if (length(parts) == 0L) {
    stop(
      "'...' must include at least one path component under extdata, e.g. \"biodiversity\".",
      call. = FALSE
    )
  }
  base <- do.call(file.path, c(list(root), parts))
  if (!dir.exists(base)) {
    stop("Directory does not exist: ", base, call. = FALSE)
  }
  sort(list.files(
    base,
    recursive = recursive,
    full.names = full.names,
    include.dirs = include.dirs,
    no.. = TRUE
  ))
}
