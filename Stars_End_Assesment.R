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


# Make a density plot of the magnitude.
#  How many peaks are there in the data?

stars |> ggplot(aes(magnitude)) + 
  geom_density()

# Examine the distribution of star temperature.

# Temperature histogram
stars %>%
  ggplot(aes(temp)) +
  geom_histogram(bins = 30, fill = "lightblue", color = "black") +
  labs(x = "Temperature", y = "Count") +
  theme_minimal()

# Temperature QQ-plot 
params <- stars |> summarize(mean = mean(temp), sd = sd(temp))

ggplot(stars, aes(sample = temp)) +
  geom_qq(dparams = params)+geom_abline()

