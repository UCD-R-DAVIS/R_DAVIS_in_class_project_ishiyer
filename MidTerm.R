
#MidTerm R Davis Fall 2024 Isha I

# loading CSV and figuring out columns
library(tidyverse)
Data <- read.csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")
str(Data)
summary(Data)
dim(Data)
colnames(Data)


# Filtering
Runningdata <- Data %>%
filter (sport == "running")
head(Runningdata)

#using mins per mile and elapsed time 

realrunning <- Runningdata %>%
  filter(minutes_per_mile >= 5 & minutes_per_mile <= 10 & total_elapsed_time_s > 1)
head(realrunning)           
    
#creating pace and form var

pacevar <- realrunning %>%
  mutate(
    pace = case_when(
      minutes_per_mile < 6 ~ "fast",
      minutes_per_mile >= 6 & minutes_per_mile <= 8 ~ "medium", minutes_per_mile > 8 ~ "slow"),
    form = ifelse(year == 2024, "new", "old"))
    
        str(realrunning)        
class(realrunning$year)   

realrunning_cleaned <- realrunning %>%
  filter(!is.na(realrunning$year))

#avg steps per min calc

average_steps <- pacevar %>%
  group_by(form, pace) %>%
  summarize(average_steps = mean(steps_per_minute, na.rm = TRUE), .groups = 'drop')

## stuck at numbering cols
  