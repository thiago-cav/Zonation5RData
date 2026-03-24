\name{zonation5rdata_list}
\alias{zonation5rdata_list}
\title{List files under a subdirectory of \code{extdata}}
\description{
Lists files (and optionally directories) inside a folder below the installed
\code{extdata} directory, e.g. all species rasters under \code{biodiversity/}.
}
\usage{
zonation5rdata_list(..., recursive = TRUE, full.names = FALSE,
  include.dirs = FALSE)
}
\arguments{
\item{...}{One or more path components relative to \code{extdata}, e.g.
\code{"biodiversity"} or \code{"other_layers"}.}
\item{recursive}{Passed to \code{\link[=list.files]{list.files()}}: include
subdirectories.}
\item{full.names}{If \code{TRUE}, return absolute paths; if \code{FALSE}, names
relative to the directory given by \code{...}.}
\item{include.dirs}{If \code{TRUE}, list directories as well as files.}
}
\value{
A character vector of file (and optionally directory) names, sorted.
}
\seealso{
\code{\link{zonation5rdata_example}}, \code{\link{zonation5rdata_path}}
}
\examples{
# All files under biodiversity/ (typically all .tif species layers)
head(zonation5rdata_list("biodiversity"))

# Absolute paths, ready for terra::rast() or similar
# head(zonation5rdata_list("biodiversity", full.names = TRUE))

# Other layers (non-recursive: only files in that folder)
zonation5rdata_list("other_layers", recursive = FALSE)
}
