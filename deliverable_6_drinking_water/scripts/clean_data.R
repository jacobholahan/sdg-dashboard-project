library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  #keep national totals only
  filter(Location == "ALLAREA") %>%
  
  pivot_longer(
    cols = `2000`:`2023`,
    names_to = "year",
    values_to = "water_access"
  ) %>%
  
  select(GeoAreaName, year, water_access) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(
    water_access = as.numeric(water_access),
    water_access = round(water_access, 2)
  ) %>%
  
  filter(!is.na(water_access))

write.csv(clean_data, "water_access_clean.csv", row.names = FALSE)
