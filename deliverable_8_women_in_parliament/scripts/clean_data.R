library(readxl)
library(dplyr)
library(tidyr)

data <- read_excel(file.choose())

clean_data <- data %>%
  
  pivot_longer(
    cols = `2000`:`2025`,
    names_to = "year",
    values_to = "women_parliament"
  ) %>%
  
  select(GeoAreaName, year, women_parliament) %>%
  
  rename(country = GeoAreaName) %>%
  
  mutate(women_parliament = as.numeric(women_parliament)) %>%
  
  filter(!is.na(women_parliament))

write.csv(clean_data, "women_parliament_clean.csv", row.names = FALSE)
