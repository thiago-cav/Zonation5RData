\name{zonation5rdata_root}
\alias{zonation5rdata_root}
\title{Root of packaged \code{extdata} directory}
\description{
Returns the path to the installed \code{extdata} directory, where raw GeoTIFFs
and metadata shipped with the package are stored.
}
\usage{
zonation5rdata_root(must_work = TRUE)
}
\arguments{
\item{must_work}{If \code{TRUE}, throws when \code{extdata} is missing (e.g. broken
install).}
}
\value{
A single string path.
}
\seealso{
\code{\link{zonation5rdata_example}}, \code{\link{zonation5rdata_list}},
\code{\link{zonation5rdata_path}}
}
\examples{
zonation5rdata_root()
}
