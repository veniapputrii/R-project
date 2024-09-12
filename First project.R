#✌ ️Load the data
#load the CSV file
data <- read.csv("data/tute1.csv")

#✌  Install and load necessary libraries
#install the necessary package
install.packages("tidyverse")

#load the package
library(tidyverse)

#✌ ️basic data exploration
#view the structure of the dataset
str(data)

#view the first few rows
head(data)

#✌ ️Data cleaning
#Check for missing values
sum(is.na(data))

#✌ ️Data Manipulation
#string to numeric
data$Sales <- as.numeric(data$Sales)
data$AdBudget <- as.numeric(data$AdBudget)
data$GDP <- as.numeric(data$GDP)

#check multiple columns
sapply(data, class)

#Character to date
data$Quarter <- as.Date(data$Quarter, format = "%y-%m-%d")

#check a specific columns 
class(data$Quarter)

#✌ ️Data Visualization
#example of a simple scatter plot
ggplot(data, aes(x = Sales, y = AdBudget))+geom_point()+theme_minimal()
