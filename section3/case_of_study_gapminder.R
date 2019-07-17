library(gapminder) 

str(gapminder)

table(gapminder$country)
gapminder %>% filter(country=="Peru")


gapminder <- gapminder %>% filter(year==2007) %>% mutate(q1 = gdpPercap/lifeExp,
                                                         q2 = log(gdpPercap/lifeExp),
                                                         q3 = log(gdpPercap)/lifeExp)

by_continent <- group_by(gapminder,continent)
by_continent



g1 <- summarise(by_continent, mean1 = mean(q1, na.rm = TRUE))%>%
 ggplot(aes(x=continent,y=mean1))+ 
 geom_bar(stat = "identity")

g2 <- summarise(by_continent, mean2 = mean(q2, na.rm = TRUE))%>%
  ggplot(aes(x=continent,y=mean2))+ 
  geom_bar(stat = "identity")

g3 <- summarise(by_continent, mean3 = mean(q3, na.rm = TRUE))%>%
  ggplot(aes(x=continent,y=mean3))+ 
  geom_bar(stat = "identity")


summarise(by_continent, mean1 = mean(q3, na.rm = TRUE), population = sum(pop , na.rm = TRUE))%>%
  ggplot(aes(x=population,y=mean1))+ 
  geom_point() + 
  geom_smooth(method="lm")
  
summarise(by_carrier, delay = mean(dep_delay, na.rm = TRUE)) %>%
  ungroup() %>% 
  mutate(day_num = seq_along(delay)) %>% 
  ggplot(aes(day_num,delay)) + 
  geom_point() + 
  geom_smooth()



plot(lifeExp ~ year, gapminder, subset = country == "Peru", type = "b")
