#install.packages("quantmod")
#install.packages("ggplot2")

library(ggplot2)
library(quantmod)

myShare <- "IBM"
myStartDate <- '2021-01-01'
myEndDate <- Sys.Date()

stock <- getSymbols(myShare,
                      
                      from = myStartDate,
                      to = myEndDate,
                      warnings = FALSE,
                      auto.assign = FALSE)

stock <- data.frame(stock)

#change the names in the data frame
names(stock) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
stock$Date <- as.Date(rownames(stock))

#Calculate 20 day moving average
stock$SMA20 <- TTR::SMA(stock$Close, n = 20)

pl <- ggplot(stock, aes(x = Date))
pl <- pl +geom_line(aes(y = Close, color = "Close"), group = 1)
pl <- pl + geom_line(aes(y = SMA20, color = "SMA20"), group = 1)
pl <- pl + theme_minimal()

pl <- pl + theme(legend.position = "top")
pl <- pl + labs(title ="Moving averages")
pl <- pl + labs(color="Prices")
pl



