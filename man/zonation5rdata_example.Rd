\name{zonation5rdata_example}
\alias{zonation5rdata_example}
\title{Example files under \code{extdata}}
\description{
Convenience wrapper around \code{\link[=system.file]{system.file()}} for raw
data shipped in \code{inst/extdata/}, following the \dQuote{\code{pkg_example()}}
pattern in the Data chapter of \emph{R Packages} (2e).
}
\usage{
zonation5rdata_example(path = NULL)
}
\arguments{
\item{path}{If \code{NULL}, names of files and directories directly under
\code{extdata}. Otherwise, path component(s): either a single string with
\code{"/"} separators or multiple character elements (e.g.
\code{c("biodiversity", "Fagus_sylvatica.tif")}).}
}
\value{
If \code{path} is \code{NULL}, a character vector of top-level names.
Otherwise a single absolute path, or an error if the file is missing
(\code{mustWork = TRUE}).
}
\references{
Wickham H, Bryan J (2025). \emph{R Packages} (2e), sec. Raw data file.
\url{https://r-pkgs.org/data.html}
}
\seealso{
\code{\link{zonation5rdata_list}} to list every file under a subfolder of
\code{extdata};
\code{\link{zonation5rdata_path}}, \code{\link{zonation5rdata_root}}
}
\examples{
zonation5rdata_example()
zonation5rdata_example("other_layers/gHM_Europe.tif")
}