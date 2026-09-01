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
flights |>
  filter(month = 1) # use = instead of ==

#arrange (shows the earliest time/date/value)
flights |>
  arrange(year, month, day, dep_time)

#arrange(desc()) -> re-order the data frame based on that column in descending(big-to-small) order.
flights |>
  arrange(desc(dep_delay))

#distinct() -> remove duplicate rows, if any
flights |>
  distinct()

#distinct() -> find all unique origin and destination pairs
flights |>
  distinct(origin, dest)

#distinct() -> (alternative) for keeping the other columns after filtering unique rows
flights |>
  distinct(origin, dest, .keep_all = TRUE)

#count
flights |>
  count(origin, dest, sort = TRUE)

#exercises
#find all flights that meet the condition :
glimpse(flights)
flights |>
  filter(arr_delay > 120)
#flew to Houston
flights |>
  filter(dest == "IAH" & dest == "HOU")
#departed in summer (july, august, and september)
flights |>
  filter(month %n% c(7,8,9))

flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

flights |>
  filter(month %in% c(4,5)
flights |>
         arrange(year, month, day, dep+time)
