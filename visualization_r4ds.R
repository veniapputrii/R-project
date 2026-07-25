library(tidyverse)
install.packages("tidyverse")
library(tidyverse)
library(palmerpenguins)
library(ggthemes)
penguins
glimpse(penguins)
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass)
  ) +
  geom_point()+
  geom_smoooth(method = 'lm')


library(tidyverse)
mpg
#left
ggplot(mpg, aes(x = displ, y=hwy, color = class)) +
  geom_point()

#right
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) +
  geom_point()