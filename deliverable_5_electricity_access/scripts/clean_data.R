library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  filter(Location == "ALLAREA") %>%
  
  pivot_longer(
    cols = `2000`:`2023`,
    names_to = "year",
    values_to = "electricity_access"
  ) %>%
  
  select(GeoAreaName, year, electricity_access) %>%
  rename(country = GeoAreaName) %>%
  
  mutate(
    electricity_access = as.numeric(electricity_access),
    electricity_access = round(electricity_access, 2)
  ) %>%
  
  filter(!is.na(electricity_access))

write.csv(clean_data, "electricity_access_clean.csv", row.names = FALSE)
