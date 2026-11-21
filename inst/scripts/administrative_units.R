# ZonationR — Multiple administrative units
#
# Reproducible code demonstrating how to run Zonation 5 analyses
# for individual administrative units using ZonationR and
# biodiversity data distributed with Zonation5RData.
#
# The script first demonstrates a single prioritisation run and
# then illustrates how to perform three separate analyses for
# different administrative units.
#
# All spatial input data, including administrative_units.tif,
# are distributed with Zonation5RData.
#
# Before running the script, replace <path-to-your-Zonation-installation>
# with the path to your local Zonation 5 installation.


library(ZonationR)
library(Zonation5RData)
library(withr)


# Prepare spatial input data

# Create folders for biodiversity and additional spatial layers
dir.create("biodiversity", showWarnings = FALSE)
dir.create("other_layers", showWarnings = FALSE)

# Get the paths to biodiversity rasters included in the package
files_biod <- zonation5rdata_list("biodiversity", full.names = TRUE)

# Copy the biodiversity rasters to the local biodiversity folder
file.copy(files_biod, "biodiversity", overwrite = TRUE)

# Get the administrative units raster included in the package
admin_units <- zonation5rdata_path("other_layers", "administrative_units.tif")

# Copy the raster to the local other_layers folder
file.copy(admin_units, "other_layers", overwrite = TRUE)


# Run a single administrative unit

feature_list(spp_file_dir = "biodiversity")

settings_file(
  feature_list_file = "feature_list.txt",
  analysis_area_mask_layer = "other_layers/administrative_units.tif"
)

command_file(
  zonation_path = "<path-to-your-Zonation-installation>",
  flags = "a",
  area = 1,
  gui_activated = TRUE
)

run_command_file(".")


# Run three administrative units in a loop

# Administrative unit identifiers
units <- c(1, 2, 3)

for (unit in units) {
  
  # Create a separate folder for each administrative unit
  folder <- paste0("unit_", unit)
  dir.create(folder, showWarnings = FALSE)
  
  withr::with_dir(folder, {
    feature_list(spp_file_dir = "../biodiversity")
    
    settings_file(
      feature_list_file = "feature_list.txt",
      analysis_area_mask_layer = "../other_layers/administrative_units.tif"
    )
    
    command_file(
      zonation_path = "<path-to-your-Zonation-installation>",
      flags = "a",
      area = unit,
      gui_activated = FALSE
    )
    
    run_command_file(".")
  })
}