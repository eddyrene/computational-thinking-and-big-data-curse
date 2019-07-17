library(tidyverse)
library(nycflights13)


by_month <- group_by(flights,month)
by_month

by_day <- group_by(flights,year,month,day)
by_day
ungroup(by_day)  