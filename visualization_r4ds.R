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
  geom_point()

