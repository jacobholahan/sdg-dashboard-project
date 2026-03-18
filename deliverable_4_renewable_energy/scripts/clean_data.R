library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  pivot_longer(
    cols = `2000`:`2022`,
    names_to = "year",
    values_to = "renewable_share"
  )

clean_data <- clean_data %>%
  select(GeoAreaName, year, renewable_share)

clean_data <- clean_data %>%
  rename(country = GeoAreaName)

clean_data <- clean_data %>%
  filter(!is.na(renewable_share))

write.csv(clean_data, "renewable_energy_clean.csv", row.names = FALSE)
