---
title: "Zonation5RData Overview"
---

## Directory layout

| Path | Contents |
|------|----------|
| `inst/extdata/biodiversity/` | EU-Trees4F SDM rasters (one GeoTIFF per species; filenames use underscore-separated Latin names). |
| `inst/extdata/other_layers/` | Supporting spatial layers, including the cost layer, area mask, and administrative units. |
| `inst/extdata/01_baseline/` | Output files from a baseline Zonation prioritization analysis. |
| `inst/extdata/metadata.md` | This file: descriptions of package contents, data sources, and attribution. |
| `inst/scripts/` | Reproducible R scripts demonstrating ZonationR workflows. |


## 1. Biodiversity Features

The biodiversity folder contains species distribution models (SDMs) retrieved from the **EU-Trees4F** dataset (Mauri et al., 2022). This dataset provides SDMs for 67 tree species across Europe at a 10 km spatial resolution. The predictions were constrained to account for ecological factors such as dispersal limitations.

## 2. Other Layers

This folder contains supporting spatial data used in Zonation analyses, such as cost or mask layers, which provide information on constraints, planning costs, or the spatial extent to guide and refine the prioritization of conservation areas.

### 2.1 Cost Layer

The gHM layer is derived from the [**Global Human Modification (gHM)**](https://developers.google.com/earth-engine/datasets/catalog/CSP_HM_GlobalHumanModification) dataset, which provides a comprehensive measure of human alteration of terrestrial lands worldwide, originally at 1 km² resolution. Values range from 0 to 1.0, representing the proportion and intensity of human modification for specific stressors (e.g., human settlement, agriculture, infrastructure). The data were retrieved and processed using Google Earth Engine.

### 2.2 Area Mask

The area mask layer was created by rasterizing the boundaries of European countries, excluding certain overseas territories (e.g., the Canary Islands and the Azores). This layer defines the spatial extent for the study, ensuring analyses are limited to the target regions.

### 2.3 Administrative Units

The `administrative_units.tif` layer provides a simplified division of Europe into three regions: Northern (1), Central (2), and Southern (3). The regions were created using country boundaries from [Natural Earth](https://www.naturalearthdata.com/) and are intended as a toy example for demonstrating adminstrative units analyses in Zonation.

## 3. Baseline Zonation Output

The `01_baseline` folder contains output files generated from a baseline Zonation prioritization analysis using the biodiversity and supporting layers included in this package. The folder includes files such as rank maps, performance curves, and summary statistics produced by the Zonation software.

## 4. Reproducible R Scripts

The `inst/scripts/` folder contains reproducible R scripts demonstrating conservation prioritization workflows using ZonationR and the datasets provided in this package.

Two example scripts are included:

- `multiple_prioritisation_variants.R`: Demonstrates four prioritization variants (baseline, CAZMAX, weights, and cost), including comparisons of prioritization outputs.
- `administrative_units.R`: Demonstrates prioritization analyses for individual administrative units and multiple units using the `administrative_units.tif` layer.

The scripts can be accessed using `zonation5rdata_list_scripts()` and `zonation5rdata_get_script()`. They require ZonationR and a local installation of Zonation 5 to run.

# References

Mauri, Achille, Marco Girardello, Giovanni Strona, Pieter SA Beck, Giovanni Forzieri, Giovanni Caudullo, Federica Manca, and Alessandro Cescatti. 2022. “EU-Trees4F, a Dataset on the Future Distribution of European Tree Species.” Journal Article. *Scientific Data* 9 (1): 37.
