# add a new column

flights %>% mutate(delay = dep_time - sched_dep_time)

flights <- flights %>% mutate(delay = dep_time - sched_dep_time)

flights %>% group_by(month)

mutate(storms,storm_id = str_c(substr(name,1,2),str_sub(year,2,4)))
storms %>% mutate(str_c(str_sub(name,1,3),str_sub(year,3,4)))
storms %>% mutate(storm_id = str_c(str_sub(name,1,3),str_sub(year,3,4)))