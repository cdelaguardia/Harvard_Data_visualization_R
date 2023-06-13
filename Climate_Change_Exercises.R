library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)


# How many times larger were carbon emissions in the last year relative to the
#  first year?

# last year 
last_year_emission <- temp_carbon |> filter(!is.na(carbon_emissions)) |>
  pull(year) |> max()
index_last_year <- which(temp_carbon$year == last_year_emission)

# first year
first_year_emission <- temp_carbon |> filter(!is.na(carbon_emissions)) |>
  pull(year) |> min()
index_first_year <- which(temp_carbon$year == first_year_emission)

# ratio
ratio <- temp_carbon$carbon_emissions[index_last_year]/temp_carbon$carbon_emissions[index_first_year]


# How many degrees Celsius has temperature increased over the date range?
# Compare the temperatures in the most recent year versus the oldest year.

# Last year
last_year_temp <- temp_carbon |> filter(!is.na(temp_anomaly)) |>
  pull(year) |> max()
index_last_year_temp <-  which(temp_carbon$year == last_year_temp) 

print(paste("The temp anomaly in",temp_carbon$year[index_last_year_temp], 
            "was of", temp_carbon$temp_anomaly[index_last_year_temp]))

# first year
first_year_temp <- temp_carbon |> filter(!is.na(temp_anomaly)) |>
  pull(year) |> min()
index_first_year_temp <-  which(temp_carbon$year == first_year_temp)

print(paste("The temp anomaly in",temp_carbon$year[index_first_year_temp], 
            "was of", temp_carbon$temp_anomaly[index_first_year_temp]))


# Make a time series line plot of carbon emissions (carbon_emissions)
#  from the temp_carbon dataset. The y-axis is metric tons of carbon
#  emitted per year.

temp_carbon |> filter(!is.na(carbon_emissions)) |>
  ggplot(aes(x = year, y = carbon_emissions)) +
  geom_point() +
  geom_line()
