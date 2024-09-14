erasmus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-08/erasmus.csv')
View(erasmus)
install.packages("tidyverse")

#checking a specific unique value
unique(erasmus$participant_profile)

#for finding unique rows 
#in multiple columns => unique(dataset_name)
unique(erasmus, n = 24)

#Change the value (gsub() to replace all instances of 
#the wrong encoding with the correct string) => $sending_city
erasmus$sending_city <- gsub("St.Pï¿½lten", "St. Pölten",
                             erasmus$sending_city)

#=>$sending_city
erasmus$receiving_city <- gsub("St.Pï¿½lten", "St. Pölten",
                               erasmus$receiving_city)
  
View(erasmus)
#filter multiple value
newF_erasmus <- erasmus[erasmus$participant_gender 
                        %in% c('Male','Female'),]

#the %in% operator is used in place of writing 
#multiple OR conditions.
unique(newF_erasmus$participant_gender)

#filter columns
filterC <- newF_erasmus[, c('project_reference','participant_gender','participant_age'
                            , 'receiving_city', 'receiving_organization','participants',
                            'sending_organization','sending_city','participant_nationality',
                            'activity_mob')]
#View that new data form
head(filterC)

#to view data types 
sapply(filterC, class) #the data types are cleaned.
View(filterC)
#to show the unique values
table(filterC$sending_city)

#change the value to be lowercase => tolower() & to be uppercase => toupper()
filterC$sending_city <- tolower(filterC$sending_city)
table(filterC$sending_city)

#group data by value types
library("tidyverse")
filterC %>%
  group_by(sending_city) %>%
  summarise(rec_count = n()) %>%
  arrange(desc(rec_count))

#🔎 new task : filter rows base on values in the sending_city column 
#     => berlin, budapest, london, dublin, prievidza
#show basic statistic of the data
#install.packages("pastecs")
#library(pastecs)
#stat.desc(filterC)
#Statistic_Visualization
#install packages that I probably need :
#color palettes
install.packages("RColorBrewer")
library(RColorBrewer)
#static plots
install.packages("ggplot2")
library(ggplot2)
#interactive plots
install.packages("plotly")
library(plotly)
#interactive web Apps
install.packages("shiny")
library(shiny)
#simple visualization


#animate / interactive visualization


#Interactive Web Apps
