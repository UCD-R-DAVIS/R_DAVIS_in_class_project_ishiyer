install.packages("magrittr")
library(tidyverse)

gapminder <- read.csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")


str(gapminder)
summary(gapminder)
colnames(gapminder)

#mean life expectancy continent wise 

gapminder %>% 
  group_by(continent, year) %>%
  summarise(mean_lifeExp = mean(lifeExp, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_lifeExp, color = continent)) +
  geom_line(size = 1) +
  labs(
    title = "Life Expectancy Over Time by Continent",
    x = "Year",
    y = "Mean Life Expectancy",
    color = "Continent"
  )

# part 2
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

# part 3 filtering and boxplot

newcountries <- gapminder %>%
filter(country == "Brazil" | country == "China" | country == "El Salvador" | country == "Niger" | country == "United States")
ggplot(newcountries, aes(x = country, y = lifeExp)) +
  geom_boxplot(outlier.color = "red", fill = "grey") +
  geom_jitter(width = 0.2, alpha = 0.5) +
  labs(title = "Life Expectancy of Five Countries") + theme_dark()



