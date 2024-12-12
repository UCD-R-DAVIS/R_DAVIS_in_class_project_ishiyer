#Week7 Assignment 

library(tidyverse)
install.packages("ggplot2")

install.packages("dplyr")
install.packages("tidyr")

gapminder <- read.csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
head(gapminder)
colnames(gapminder)
str(gapminder)

gapminder_pivot <- gapminder %>%
  filter(year %in% c(2002, 2007)) %>%
  select(country, year, pop, continent) %>%
  pivot_wider(names_from = year, values_from = pop) %>%
  mutate(pop_diff = `2007` - `2002`)

gapminder_pivot$country <- factor(gapminder_pivot$country,
                                  levels = gapminder_pivot$country[order(gapminder_pivot$`2007`)])
ggplot(gapminder_pivot, aes(x = country, y = pop_diff, color = pop_diff)) +
  geom_bar(stat = "identity", fill = "green") + 
  scale_color_viridis_c() +  
  facet_wrap(~ continent, scales = "free_y") +  
  theme_light() +  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1), 
    legend.position = "none"   ) +
  labs( title = "Population Difference between 2002 and 2007",  x = "Country", y = "Population Difference")





