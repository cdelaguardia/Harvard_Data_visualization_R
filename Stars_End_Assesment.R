library(tidyverse)
library(dslabs)
library(lattice)
library(ggrepel)
data(stars)
options(digits = 3)   # report 3 significant digits


# What is the mean magnitude?
magnitude_mean  <- mean(stars$magnitude)

# What is the standard deviation of magnitude?
magnitude_sd <- sd(stars$magnitude)