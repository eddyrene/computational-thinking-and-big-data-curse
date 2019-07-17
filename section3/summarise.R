library(tidyverse)
library(nycflights13)

by_month <- group_by(flights,month)
summarise(by_month, delay = mean(dep_delay, na.rm = TRUE))


by_day <- group_by(flights,year,month,day)
by_day
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE)) %>%
  ungroup() %>% 
  mutate(day_num = seq_along(delay)) %>% 
  ggplot(aes(day_num,delay)) + 
  geom_point() + 
  geom_smooth()


mean(by_day$dep_delay, na.rm = TRUE)
seq_along(mean(by_day$dep_delay, na.rm = TRUE))

summarise(by_day, delay = mean(dep_delay, na.rm = TRUE), num_flights = n()) %>%
  ggplot(aes(num_flights,delay)) + 
  geom_point() + 
  geom_smooth()

#quiz

by_carrier <- group_by(flights,carrier)
tr<-(summarise(by_carrier, delay = mean(dep_delay, na.rm = TRUE)))
min(tr$delay)
colnames(by_carrier)
table(by_carrier$carrier)

summarise(by_carrier, delay = mean(dep_delay, na.rm = TRUE)) %>%
  ungroup() %>% 
  mutate(day_num = seq_along(delay)) %>% 
  ggplot(aes(day_num,delay)) + 
  geom_point() + 
  geom_smooth()

