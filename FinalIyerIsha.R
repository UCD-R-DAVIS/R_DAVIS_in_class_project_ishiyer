#RFinal Fall 2024 Isha 

library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
Data <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

str(Data)
head(Data)

Runningdata <- Data %>%
  filter (sport == "running")

realrunning <- Runningdata %>%
  filter(minutes_per_mile >= 5 & minutes_per_mile <= 10 & total_elapsed_time_s > 1)
head(realrunning)     

realrunning <- realrunning %>%
  filter(!is.na(year))

group <- realrunning %>%
  mutate(time_period = case_when(
    year < 2024 ~ "Pre-2024", 
    year >= 2024 & month <= 6 ~ "Initial Rehab", 
    year >= 2024 & month > 6 ~ "Post-Rehab",
    TRUE ~ "Unknown"  
  ))
head(realrunning)


#ggplot

ggplot(realrunning, aes(x = speed, y = SPM)) +
geom_point(aes(color = time_period, shape = time_period)) +  geom_smooth(aes(color = time_period), method = "lm", se = FALSE) + 
scale_color_manual(values = c("Pre-2024" = "blue", "Initial Rehab" = "orange", "Post-Rehab" = "green")) + 
  labs(title = "Scatter Plot of SPM Over Speed by Lap", x = "Speed", y = "Steps per Minute (SPM)", color = "Time Period", shape = "Time Period") +
  theme_minimal()
geom_smooth(aes(color = time_period), method = "lm", se = FALSE)

