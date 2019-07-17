

airlines

flights <- left_join(flights, airlines, by = "carrier")

flights %>% select(year, month, day, carrier, name)

# quiz 
planes
colnames(flights)
colnames(airports)

flights %>% right_join(airports, by = c("origin" = "faa")) 

flights %>% left_join(airports, by = c("origin" = "faa")) 

new_flights <- flights %>% left_join(planes, by = "tailnum") 
colnames(new_flights)
tr <- head(new_flights,5)
table(tr$manufacturer)
tr$model