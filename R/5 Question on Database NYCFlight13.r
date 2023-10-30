##5 Question on Database NYCFlight13
##1.Top 10 flight delay
df1 <- flights %>%
	  select(symbol = carrier, flight_number = flight, min_delay= dep_delay)%>%
	  mutate(hr_delay = min_delay / 60) %>%
	  arrange(desc(hr_delay)) %>%
	  head(10)
df2 <- airlines %>%
    select(name,carrier)%>%
    select(symbol = carrier,name)

fulldf1 <- inner_join(df1, df2, by = "symbol")


tibble(fulldf1)

##2.the 10 airlines with the longest flight times and distances.
df1 <- flights %>%
  select(symbol = carrier, flight_number = flight, air_time, distance, origin, dest) %>%
  mutate(faa = origin, faa2 = dest) %>%
  arrange(desc(air_time), desc(distance)) %>%
  distinct(symbol, .keep_all = TRUE)%>%
  head(10)

df2 <- airlines %>%
  select(name,carrier)%>%
  select(symbol = carrier,name)

df3 <- airports %>%
  select(faa,name)

df4 <- airports %>%
  select(faa2 = faa,name)
  

  
fulldf1 <- df1 %>%
  inner_join(df2, by = "symbol") %>%
  inner_join(df3, by = "faa")%>% 
  inner_join(df4, by = "faa2") 

fulldf1 <- fulldf1 %>%
  rename(airline_name = name.x, destination_name = name, origin_name = name.y)

fulldf1 <- fulldf1 %>%
  select(flight_number, symbol, airline_name, origin, origin_name, dest, destination_name, air_time, distance)
View(fulldf1)

#3.the flight with the most departures from origin to destination
df1 <- flights%>%
  group_by(origin,dest)%>%
  summarise(number_of_flights = n()) %>%
  arrange(desc(number_of_flights))%>%
  head(1)

View(df1)

#4.Top 10 airline that most delay
df1 <- flights %>%
  select(symbol = carrier, dep_delay)

  
df2 <- airlines %>%
  select(name,carrier)%>%
  select(symbol = carrier,name)

fulldf1 <- inner_join(df1, df2, by = "symbol")

NDF <-fulldf1 %>%
  group_by(name)%>%
  filter(dep_delay < 0) %>%
  summarise(number_of_delay_flight = n())%>%
  arrange(desc(number_of_delay_flight))%>%
  head(10)

View(NDF)

#5.Top 5 place that most people go
df1 <- flights%>%
  group_by(dest)%>%
  summarise(number_of_flights = n()) %>%
  arrange(desc(number_of_flights))%>%
  head(5)

View(df1)
