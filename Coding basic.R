#Coding basics
1/200 * 30
(59+73+2) /3

100/5
(129+453)/12

prime <- c(2,4,5,7,3,1,8)

prime * 2
# 4 8 10 14 6 1 16

prime - 1
# 1 3 4 6 2 0 7

#object name
this_is_the_time
forLearningR
and.learning.about.statistics
IaM.so_exciteD

rock <- 6^7
Rock
#error
rockr
#error

seq(from = 1, to = 10)
#> [1] 1 2 3 4 5 6 7 8 9 10

seq (1,10)
#same result as [1]

#task
my_variable <- 19
my_variable

x <- "hello world"
> x <- "hello 
+



library(tidyverse)
ggplot(data = mpg) +
  geom_point(maping = aes(x = displ, y = hwy)) +
  geom_smooth(method="lm")


library(tidyverse)
#1.6 
ggplot(penguins, aes(x = flipper_len, y = body_mass)) +
  geom_point()
ggsave(filename = "penguin-plot.png")

#exercise
data <- mpg
my_bar_plot <- ggplot(data, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y=hwy)) +
  geom_point()
ggsave(filename ="mpg-plot.png", plot = my_bar_plot)

#both of them can save the images because it utilize "ggsave"
