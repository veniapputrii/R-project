install.packages("jsonlite")
library(jsonlite)
install.packages("languageserver")
library(languageserver)
install.packages("readr")  
library(readr)

#load data
stock <- read_csv("data/stock_details_5_years.csv")
View(stock)



