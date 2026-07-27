library(tidyverse)
install.packages("tidyverse")
library(tidyverse)
library(palmerpenguins)
library(ggthemes)
penguins
glimpse(penguins)
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_point(aes(color = species, shape = species))+
  geom_smooth(method = 'lm') +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gento penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    
  ) 


library(tidyverse)
mpg
#left
ggplot(mpg, aes(x = displ, y=hwy, color = class)) +
  geom_point()

#right
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) +
  geom_point()
