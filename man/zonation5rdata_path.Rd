\name{zonation5rdata_path}
\alias{zonation5rdata_path}
\title{Paths to packaged educational GeoTIFF data}
\description{
After installation, raster files live under \code{inst/extdata} in the package
source tree. Use these helpers instead of hard-coding paths.
}
\usage{
zonation5rdata_path(..., must_work = FALSE)
}
\arguments{
\item{...}{Character vectors, passed to \code{\link[=file.path]{file.path()}} relative to \code{extdata}.}
\item{must_work}{If \code{TRUE}, error when the path does not exist.}
}
\value{
A single string path. Empty string if nothing is found (when
\code{must_work} is \code{FALSE}).
}
\seealso{
\code{\link{zonation5rdata_root}} for the \code{extdata} directory alone;
\code{\link{zonation5rdata_example}} for the \code{pkg_example()}-style API;
\code{\link{zonation5rdata_list}} to list files under a subfolder.
}
\examples{
zonation5rdata_root()
zonation5rdata_path("other_layers", "gHM_Europe.tif")
}
