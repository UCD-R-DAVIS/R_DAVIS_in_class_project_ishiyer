library(tidyverse)
library(dplyr)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa_cleaned <- mloa %>%
  filter(!is.na(rel_humid) & !is.na(temp_C_2m) & !is.na(windSpeed_m_s))
mloa_cleaned <- mloa_cleaned %>%
mutate(datetime = ymd_hm(paste(year, month, day, hour24, min)))
        

mloa_cleaned <- mloa_cleaned %>%
mutate(datetimeLocal = with_tz(datetime, tzone = "Pacific/Honolulu"))


str(mloa_cleaned)
mean_temp_monthly <- mloa_cleaned %>%
  mutate(month = month(datetimeLocal, label = TRUE), year = year(datetimeLocal)) %>%
  group_by(year, month) %>%             
  summarise(mean_temp = mean(temp_C_2m, na.rm = TRUE))
      
ggplot(aes(x = localMon,
           y = meantemp)) +
  geom_point(aes(col = localHour))
scale_color_viridis_d() +          
  labs( title = "Mean Hourly Temperature by Month",  
    x = "Month", y = "Mean Temperature (°C)",color = "Local Hour") +
theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
