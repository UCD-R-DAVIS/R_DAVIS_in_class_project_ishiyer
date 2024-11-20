library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
categories <- unique(surveys$plot_type)
length(categories)

spec(surveys)

surveys_wide <- surveys %>% 
  group_by(genus, plot_type)  %>% 
filter(!is.na(hindfoot_length)) %>% 
  summarise(mean_hindfoot = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control)
summary(surveys$weight)

surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small", weight > 20.00 & weight < 48.00 ~ "medium", weight >= 48.00 ~ "large" ))
glimpse(surveys_wide)
summary(surveys_wide)



