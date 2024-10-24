library(tidyverse)
surveys_t <- read_csv(file = "data/portal_data_joined.csv")
head(surveys_t)
select(surveys_t)

#part 1 
filtered_data <- surveys_t %>%
filter(weight %in% 30:60) %>%
head(6)
print(filtered_data)

#Part 2 & 3 
biggest_critters <- surveys_t
filter(is.na(weight))
biggest_critters <- surveys_t %>%
  filter(!is.na(weight)) %>%          
  group_by(species, sex) %>% 
  summarise(max_weight=max(weight)) %>% 
  arrange(desc(max_weight))
print(biggest_critters)

#part 4
surveys_t  %>%
filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(desc(n))

#part 5

surveys_avg_weight <- surveys_t %>%
  filter(is.na(weight)) %>%
  group_by(sex, species_id) %>%
  mutate(avg_weight = mean(weight)) %>%. #read ab mutate
select(weight, species_id, sex, avg_weight)
print(surveys_avg_weight)


surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)
print(surveys_avg_weight)


  