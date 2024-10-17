surveys <- read.csv("data/portal_data_joined.csv")
str(surveys)
class(surveys)
surveys
head(surveys)
getwd()
nrow(surveys)
ncol(surveys)
head(surveys)
summary(surveys)

surveys[1,3]
surveys_base <- surveys
surveys_base <- data.frame()
head(surveys)
colnames(surveys_base)
surveys_base[1:5000, c(6,9,13)]
surveys_base <- surveys_base[complete.cases(surveys_base),]
surveys_base$species_id <- factor(surveys_base$species_id)

#characters store string data and factors can store categorical data (which can be chronological or not)