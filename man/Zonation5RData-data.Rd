\name{Zonation5RData-data}
\alias{Zonation5RData-data}
\title{Educational spatial data for Zonation and ZonationR}
\description{
This package ships \strong{curated} GeoTIFF layers for teaching and for trying
Zonation / ZonationR workflows.
All rasters are in WGS84 (EPSG:4326). Raw files follow the \code{inst/extdata/}
pattern described in \emph{R Packages} (2e), ch. Data
(\url{https://r-pkgs.org/data.html}). Layers are documented in
\code{system.file("extdata", "metadata.md", package = "Zonation5RData")} and in
the \strong{README} of the source repository.

\strong{Biodiversity} (\code{extdata/biodiversity/}): species distribution models from
EU-Trees4F (Mauri et al., 2022).

\strong{Other layers} (\code{extdata/other_layers/}): \code{gHM_Europe.tif} (cost)
and \code{area_mask.tif} (planning extent).
}
\references{
Wickham H, Bryan J (2025). \emph{R Packages} (2e). O'Reilly.
\url{https://r-pkgs.org/data.html} (sec. Raw data file, \code{inst/extdata/}).

Mauri, A., Girardello, M., Strona, G., Beck, P.S.A., Forzieri, G.,
Caudullo, G., Manca, F., Cescatti, A. (2022). EU-Trees4F, a dataset on the
future distribution of European tree species. \emph{Scientific Data} 9, 37.
\doi{10.1038/s41597-022-01199-1}
}
\keyword{datasets}
