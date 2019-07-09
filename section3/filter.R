library(tidyverse)
library(nycflights13)
#library(dplyr)
#For ROWS
flights

filter(flights,month == 1)

filter(flights, month == 1, day == 1)

flights %>% filter(month == 1, day == 1)

flights %>% filter(carrier == "AA")

#test
filter(mpg, displ == 1.8)

library(tidyverse)
mpg %>% filter(cyl == 4) %>% nrow()

n1 <- starwars %>% filter(species == "Droid") %>% nrow()
round(n1/nrow(starwars),3)

filter(data, var1 < 23, var9 == "test")

data %>% filter(var1 < 23) %>% filter(var9 == "test")