install.packages("jsonlite")
library(jsonlite)
install.packages("languageserver")
library(languageserver)
install.packages("readr")  
library(readr)

#task : 
#You work in finance and one of your clients wants to understand 
#the value of different company stocks over time. 
#Given a dataset of stock prices, you decide to use simple moving averages 
#(window length = 20) to tackle this task. 
#What companies have an upward trend for the most recent data? 
#And what companies have a downward trend?

#load data
stock <- read_csv("data/stock_details_5_years.csv")

#Descriptive statistics
#Ich will das Datum verändern, Date-Typ zum konvertieren
stock$Date <- gsub(x=stock$Date, pattern="T.*", replacement="")
stock$Date <- as.Date(stock$Date)






