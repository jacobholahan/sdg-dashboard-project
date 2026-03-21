library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  filter(Activity == "TOTAL") %>%
  
  pivot_longer(
    cols = `2000`:`2022`,
    names_to = "year",
    values_to = "co2_emissions"
  ) %>%
  
  select(GeoAreaName, year, co2_emissions) %>%
  
  rename(country = GeoAreaName) %>%
  
  filter(!is.na(co2_emissions))

write.csv(clean_data, "co2_emissions_clean.csv", row.names = FALSE)
