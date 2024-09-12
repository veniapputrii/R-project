erasmus <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-03-08/erasmus.csv')
View(erasmus)
install.packages("tidyverse")

#checking a specific unique value
unique(erasmus$participant_profile)

#for finding unique rows 
#in multiple columns => unique(dataset_name)
unique(erasmus, n = 24)

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
View(filterC)
