## 0 - Setup

#################
# Package Setup #
#################
#Check if pacman [package manager] is installed, if not install it.
#throw [FYI] alert either way.
if (!requireNamespace("pacman", quietly = TRUE)) {
  message("Installing 'pacman' (not found locally)...")
  install.packages("pacman")
} else {
  message("[FYI]\n'pacman' already installed — skipping install.")
}
# use this line for installing/loading
# pacman::p_load()
# - packages to load stored in a variable (vector)
pkgs <- c(
  "tidyverse",
  "glue",
  "scales",
  "lubridate",
  "patchwork",
  "ggh4x",
  "ggrepel",
  "openintro",
  "here"
)
# - load from the character array/vector
pacman::p_load(char = pkgs)

# - install tidyverse/dsbox directly from Git Hub
# - this allows for the possible need to install on a repo. pull.
# - and, if it's already installed just thorw an alert.
if (!requireNamespace("dsbox", quietly = TRUE)) {
  message("Installing 'dsbox' from GitHub (not found locally)...")
  suppressMessages(devtools::install_github("tidyverse/dsbox"))
} else {
  message("[FYI]\n'dsbox' already installed — skipping GitHub install.")
}

# - alert to user packages loaded.
cat(paste(
  "The packages loaded:",
  paste("-", pkgs, collapse = "\n"),
  sep = "\n"
))

#-------------------------->
######################
# Basic set Theme up #
######################
# set theme for ggplot2
ggplot2::theme_set(ggplot2::theme_minimal(base_size = 14))

# set width of code output
options(width = 65)

# set figure parameters for knitr
knitr::opts_chunk$set(
  fig.width = 7,        # 7" width
  fig.asp = 0.618,      # the golden ratio
  fig.retina = 3,       # dpi multiplier for displaying HTML output on retina
  fig.align = "center", # center align figures
  dpi = 300             # higher dpi, sharper image
)
#######
water_insecurity_2022 <- read_csv(here("water_insecurity",
                                       "water_insecurity_2022.csv"))
water_insecurity_2023 <- read_csv(here("water_insecurity",
                                       "water_insecurity_2023.csv"))


View(water_insecurity_2022)
spec(water_insecurity_2022)
View(water_insecurity_2023)
spec(water_insecurity_2022)

#-- different ways to see names of columns.
#cat("Using names()")
names(water_insecurity_2022)
#cat("Using colnames()")
colnames(water_insecurity_2022)
cat(names(water_insecurity_2022), sep = "\n")
# - print one of the lists
#print(water_insecurity_2022$geometry[1])
county1 <- water_insecurity_2022$geometry[1]

#get stats on the 'name' category.
unique_names_22 <- unique(water_insecurity_2022$name)
#print(unique_names)

unique_names_23 <- unique(water_insecurity_2023$name)
#print(unique_names)

print(identical(unique_names_22, unique_names_23))

cat("In 22 and not in 23\n")
mismatch_22_not_23 <- setdiff(unique_names_22, unique_names_23)
print(mismatch_22_not_23)

# Names in 2023 but NOT in 2022
cat("In 23 and not in 22\n")
mismatch_23_not_22 <- setdiff(unique_names_23, unique_names_22)
print(mismatch_23_not_22)
