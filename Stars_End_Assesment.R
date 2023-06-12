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

# Make a scatter plot of the data with temperature on the x-axis and
#  magnitude on the y-axis and examine the relationship between the variables.
#  Recall that lower magnitude means a more luminous (brighter) star.
# Most stars follow a _______________ trend. These are called main sequence stars.

stars |> ggplot(aes(x = temp, y = magnitude)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10")

# The least lumninous star in the sample with a surface temperature over 
# 5000K is _________.
stars |> filter(temp > 5000, magnitude > 0) |> ggplot(aes(x = temp, y = magnitude, label = star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10") +  geom_label_repel()

# The two stars with lowest temperature and highest luminosity are known as supergiants.
#  The two supergiants in this dataset are ____________.
stars |> filter(temp < 5000, magnitude < 0) |> ggplot(aes(x = temp, y = magnitude, label = star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous(trans = "log10") +  geom_label_repel()

  
  
  

