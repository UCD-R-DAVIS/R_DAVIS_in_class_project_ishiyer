#learning dplyr and tidyr: select, filter, and pipes
#only do this once ever:
install.packages(tidyverse)
  #We've learned bracket subsetting
  #It can be hard to read and prone to error
  #dplyr is great for data table manipulation!
  #tidyr helps you switch between data formats
  
  #Packages in R are collections of additional functions
  #tidyverse is an "umbrella package" that
  #includes several packages we'll use this quarter:
  #tidyr, dplyr, ggplot2, tibble, etc.
  
  #benefits of tidyverse
  #1. Predictable results (base R functionality can vary by data type) 
  #2. Good for new learners, because syntax is consistent. 
  #3. Avoids hidden arguments and default settings of base R functions
  
  #To load the package type:
  library(tidyverse)
    #now let's work with a survey dataset
    surveys <- read_csv("data/portal_data_joined.csv")
      
      
      str(surveys)
        
        
        
        
        
        
        
        
        
        #select columns
        month_day_year <- select(surveys, month, day, year)
          length(month_day_year)
          #filtering by equals
          year_1981 <- filter(surveys, year==1981)
            sum(year_1981$year !=1981, na.rm = T)
            
            
            #filtering by range
            the80s <- surveys[surveys$year %in% 1981:1983,]
            the80stidy <- filter (surveys, year %in% 1981:1983)
                   #5033 results
                   
                   
                   #review: why should you NEVER do:
            the80srecycle <- filter(surveys, year == 1981:1983)
                          #1685 results
                          
                          #This recycles the vector 
                          #(index-matching, not bucket-matching)
                          #If you ever really need to do that for some reason,
                          #comment it ~very~ clearly and explain why you're 
                          #recycling!
                          
                          #filtering by multiple conditions
                          bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight)
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        #multi-step process
                                                        
                                                        small_animals <- filter(surveys, weight < 5)
                                                        
                                                        
                                                                                #this is slightly dangerous because you have to remember 
                                                                                #to select from small_animals, not surveys in the next step
                                                                                small_animal_ids <- select(small_animals, 
                                                                                                           
                                                                                                           #same process, using nested functions
                                                                                                           small_animal_ids <- select(filter(surveys < 5), record_id, plot_id, species_id)
# Data Manipulation Part 1b ----
# Goals: learn about mutate, group_by, and summarize
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)


# Adding a new column
# mutate: adds a new column
surveys <- surveys %>%
  mutate(weight_kg = weight/1000)

# Add other columns


# Filter out the NA's


# Group_by and summarize ----
# A lot of data manipulation requires us to split the data into groups, apply some analysis to each group, and then combine the results
# group_by and summarize functions are often used together to do this
# group_by works for columns with categorical variables 
# we can calculate mean by certain groups
surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE)) 


# multiple groups
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))


# remove na's


# sort/arrange order a certain way


# Challenge
#What was the weight of the heaviest animal measured in each year? Return a table with three columns: year, weight of the heaviest animal in grams, and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. (This table should have 26 rows, one for each year)


#Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. How could you get the same result using group_by() and summarize()? Hint: see ?n.                                                                                                             
                                                                                                             #same process, using a pipe
                                                                                                             #Cmd Shift M
                                                                                                               %>% 
                                                                                                             #or |>
                                                                                                             #note our select function no longer explicitly calls the tibble
                                                                                                             #as its first element
                                                                                                             small_animal_ids <- filter(surveys, weight < 5) %>% 
                                                                                                               select(
                                                                                                                 
                                                                                                                 #same as
                                                                                                                 small_animal_ids <- surveys %>% filter(., weight < 5)  %>% 
                                                                                                                   select(., plot_id, species_id, record_id)
                                                                                                                   
                                                                                                                   
                                                                                                                   #how to do line breaks with pipes
                                                                                                                   
                                                                                                                     
                                                                                                                     #good:
                                                                                                                     surveys %>% 
                                                                                                                       filter(month==1)
                                                                                                                     
                                                                                                                     #not good:
                                                                                                                     surveys %>% filter(month==1)
                                                                                                        
                                                                                                                     #what happened here?
                                                                                                                     ##use pipe as a -- in a sentence 
                                                                                                                     #line break rules: after open parenthesis, pipe,
                                                                                                                     #commas, 
                                                                                                                     #or anything that shows the line is not complete yet
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     #check out cute_rodent_photos!
                                                                                                                     #will be updated throughout the quarter
                                                                                                                     #as a bonus for checking out these videos
                                                                                                                     #and visiting the code demos on my repository
                                                                                                                     
                                                                                                                     
                                                                                                                     #one final review of an important concept we learned last week
                                                                                                                     #applied to the tidyverse
                                                                                                                     
                                                                                                                     mini <- surveys[190:209,]
                                                                                                                     table(mini$species_id)
                                                                                                                     #how many rows have a species ID that's either DM or NL?
                                                                                                                     nrow(mini)
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                                                                     