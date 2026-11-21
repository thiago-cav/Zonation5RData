# ZonationR — Multiple prioritisation variants
#
# Complete executable code accompanying the multiple-variant workflow
# presented in:
#
# Cavalcante et al. (2026)
# "ZonationR: An R interface to the Zonation software for reproducible
# spatial conservation prioritisation workflows"
# Ecography
#
# The script reproduces the four prioritisation variants presented in the
# paper and the subsequent comparison of their spatial priority outputs.
#
# Before running the script, replace <path-to-your-Zonation-installation>
# with the path to your local Zonation 5 installation.


library(ZonationR)
library(Zonation5RData)
library(withr)
library(terra)
library(patchwork)
library(ggplot2)


# Create folders to store the input data
dir.create("biodiversity", showWarnings = FALSE)
dir.create("other_layers", showWarnings = FALSE)

# Get the paths to biodiversity rasters included in the package
files_biod <- zonation5rdata_list("biodiversity", full.names = TRUE)

# Copy the biodiversity rasters to the local biodiversity folder
file.copy(files_biod, "biodiversity", overwrite = TRUE)

# Get the paths to the additional layers included in the package
files_other <- zonation5rdata_list("other_layers", full.names = TRUE)

# Copy these rasters to the local other_layers folder
file.copy(files_other, "other_layers", overwrite = TRUE)


# Run baseline variant in folder 01_baseline
dir.create("01_baseline", showWarnings = FALSE)
withr::with_dir("01_baseline", {
  feature_list(spp_file_dir = "../biodiversity")
  settings_file(feature_list_file = "feature_list.txt")
  command_file(zonation_path = "<path-to-your-Zonation-installation>")
  run_command_file(".")
})


# Variant 02
dir.create("02_cazmax_a", showWarnings = FALSE)

withr::with_dir("02_cazmax_a", {
  feature_list(spp_file_dir = "../biodiversity")
  settings_file(feature_list_file = "feature_list.txt",
                analysis_area_mask_layer = "../other_layers/area_mask.tif")
  command_file(zonation_path      = "<path-to-your-Zonation-installation>",
               marginal_loss_mode = "CAZMAX", # We edit the marginal loss rule here
               flags = "a")
  run_command_file(".")
})


# Variant 03
dir.create("03_cazmax_aw", showWarnings = FALSE)

# List files from the biodiversity folder
spp_files <- list.files("biodiversity", pattern = "\\.tif$", full.names = TRUE)

# Create a weight vector: default weight = 1 for all species
weights <- rep(1, length(spp_files))

# Set higher weights for selected key species
# For example, species 3, 7, and 10 are more important
weights[c(3, 7, 10)] <- 5.0

# Run the prioritization
withr::with_dir("03_cazmax_aw", {
  feature_list(spp_file_dir = "../biodiversity",
               weight = weights) # setting weights
  settings_file(feature_list_file = "feature_list.txt",
                analysis_area_mask_layer = "../other_layers/area_mask.tif")
  command_file(zonation_path = "<path-to-your-Zonation-installation>",
               marginal_loss_mode = "CAZMAX",
               flags = "aw" # Flag w (use weights)
  )
  run_command_file(".")
})

# Variant 04
dir.create("04_cazmax_awX", showWarnings = FALSE)

withr::with_dir("04_cazmax_awX", {
  feature_list(spp_file_dir = "../biodiversity",
               weight = weights)
  settings_file(feature_list_file = "feature_list.txt",
                analysis_area_mask_layer = "../other_layers/area_mask.tif",
                cost_layer = "../other_layers/gHM_Europe.tif") # We add the cost layer here
  command_file(zonation_path = "<path-to-your-Zonation-installation>",
               marginal_loss_mode = "CAZMAX",
               flags = "awX" # using X to activate the cost analysis
  )
  run_command_file(".")
})


# Priority maps
# Function: priority_map()
# Purpose: visualise spatial priority outputs per scenario

p0 <- priority_map("01_baseline") + ggtitle("Baseline")
p1 <- priority_map("02_cazmax_a") + ggtitle("CAZMAX")
p2 <- priority_map("03_cazmax_aw") + ggtitle("CAZMAX + weights")
p3 <- priority_map("04_cazmax_awX") + ggtitle("CAZMAX + weights + cost")

(p0 | p1)/(p2 | p3)


# Load rank maps and compute spatial similarity
# Function: rank_similarity()
# Purpose: import Zonation rank maps, build stack, and quantify agreement across scenarios

folders <- c("01_baseline",
             "02_cazmax_a",
             "03_cazmax_aw",
             "04_cazmax_awX")

r_stack <- terra::rast(lapply(folders, function(f) {
  terra::rast(file.path(f, "output", "rankmap.tif"))
}))

names(r_stack) <- folders

# Spatial similarity across scenarios
rank_similarity(rstack = r_stack, method = "schoener")
rank_similarity(rstack = r_stack, method = "jaccard", threshold = 0.9)


# Coverage at top priority
# Function: coverage_distribution()
# Purpose: evaluate feature representation at top-priority threshold (0.9)

p4 <- coverage_distribution("01_baseline",   target_rank = 0.9) + ggtitle("Baseline")
p5 <- coverage_distribution("02_cazmax_a",   target_rank = 0.9) + ggtitle("CAZMAX")
p6 <- coverage_distribution("03_cazmax_aw",  target_rank = 0.9) + ggtitle("CAZMAX + weights")
p7 <- coverage_distribution("04_cazmax_awX", target_rank = 0.9) + ggtitle("CAZMAX + weights + cost")

(p4 | p5)/(p6 | p7)
