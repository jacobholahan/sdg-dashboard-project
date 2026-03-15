library(readxl)
data <- read_excel(file.choose())
head(data)

library(dplyr)

us_data <- data %>%
  filter(Sex == "BOTHSEX")

library(tidyverse)

clean_data <- us_data %>%
  pivot_longer(
    cols = `2000`:`2021`,
    names_to = "year",
    values_to = "suicide_rate"
  )
clean_data <- clean_data %>%
  select(year, suicide_rate)

clean_data <- clean_data %>%
  mutate(country = "United States")

clean_data <- clean_data %>%
  select(country, year, suicide_rate)

write.csv(clean_data, "us_suicide_rate_clean.csv", row.names = FALSE)
