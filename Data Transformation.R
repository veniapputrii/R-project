install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
flights 
#shows the flightstable
glimpse(flights)
#shows all columns

#combining multiple verbs
flights |>
  filter(dest == "IAH") |>
  group_by(year,month, day) |>
  summarize(
    arr_delay = mean(arr_delay, na.rm= TRUE)
)

#filter the values
flights |> #example : we try to find all flights that departed more than 120 minutes
  filter(dep_delay > 120) # only take the value where dep_delay is greater than 120

#symbols :
#> (greater than)
#>= (greater than or equal to)
#< (less than)
# <= (less than or equal to)
#== (equal to)
#!= (not equal to)
# $ / , (and)
# | (or)

#flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

#flights depart in january or february
flights |>
  filter(month == 1 | month == 2)
#another shotcut for combining == and | -> %n%
flights |>
  filter(month %in% c(1,2)) 
jan12 <- flights |>
  filter(month %in% c(2,4))
jan12

#common mistakes
fligts |>
  filter(month = 1) # use = instead of ==