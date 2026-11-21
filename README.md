# Zonation5RData

*Zonation5RData* provides curated spatial datasets, Zonation 5 outputs, and reproducible R scripts to 
support teaching, learning, and experimentation with [ZonationR](https://github.com/thiago-cav/ZonationR). The datasets are derived 
from freely available, referenced sources and have been processed and organized to facilitate the exploration of 
ZonationR functionalities and spatial conservation prioritization workflows. These materials are intended for 
educational and demonstration purposes and may not be suitable for real-world research applications without 
further evaluation. 

## Installation

``` r
remotes::install_github("thiago-cav/Zonation5RData")
```

## Usage

After installation, the datasets can be accessed using the package's helper functions.

``` r
library(Zonation5RData)

# Locate the data directory
zonation5rdata_root()

# List available biodiversity layers
zonation5rdata_list("biodiversity")

# List additional spatial layers
zonation5rdata_list("other_layers")

# Access individual files
zonation5rdata_path("biodiversity", "Fagus_sylvatica.tif")
zonation5rdata_path("other_layers", "gHM_Europe.tif")

# Access example Zonation 5 analysis outputs
zonation5rdata_path("01_baseline", "output", "rankmap.tif")
```

Spatial layers can be loaded directly into R using packages such as `terra`:

``` r
library(terra)

r <- rast(zonation5rdata_path(
  "biodiversity", "Fagus_sylvatica.tif"
))

plot(r)
```

## Reproducible R scripts

The package includes reproducible R scripts demonstrating different ZonationR workflows. Users can list and open the available scripts in their R editor.

``` r
# List available scripts
zonation5rdata_list_scripts()

# Open a selected script
zonation5rdata_get_script("administrative_units")
```

Scripts are not executed automatically. Users can inspect them and save copies to adapt for their own analyses.


## Citation and attribution

If you use these materials, please cite *Zonation5RData* and the original data sources listed in [`metadata.md`](inst/extdata/metadata.md).

To obtain the package citation in R:

``` r
citation("Zonation5RData")
```
For detailed descriptions of the datasets, their sources, and attribution requirements use:

``` r
zonation5rdata_info()
```

## Licence

The package code is licensed under the [MIT Licence](LICENSE). The included datasets retain their original licences and attribution requirements, as documented in [`metadata.md`](inst/extdata/metadata.md).
