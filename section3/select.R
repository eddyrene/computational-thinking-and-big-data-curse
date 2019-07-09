#for columns
flights %>%
  filter(carrier == "AA",month == 1, day == 1) %>%
  select(flight,dep_time,arr_time)


#variables that that have something to do with “time”
select(flights, contains("time"))
# or 
flights %>% select(contains("time"))


flights %>% select(starts_with("dep"))

select(flights, year:day)

colnames(flights)

#select if 

starwars_num <- select_if(starwars,is.numeric) %>% print()



