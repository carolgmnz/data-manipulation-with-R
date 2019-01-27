# Section 7
# The syntax of summarize
# hflights and dplyr are loaded in the workspace
names(hflights)

# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist=min(Distance), max_dist=max(Distance))

# Print out a summary with variable max_div
filter(hflights,Diverted==1) %>% summarise(max_div=max(Distance))

# Aggregate functions
# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest=min(ArrDelay),average=mean(ArrDelay),latest=max(ArrDelay),sd=sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarize()
summarise(temp2, max_taxi_diff=max(abs(TaxiIn-TaxiOut)))

# dplyr aggregate functions
# hflights is available with full names for the carriers
names(hflights)
# Generate summarizing statistics for hflights
summarize(hflights,
          n_obs = n(),
          n_carrier = n_distinct(UniqueCarrier),
          n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarize(aa, n_flights= n(), n_canc= sum(Cancelled), avg_delay=mean(ArrDelay, na.rm=TRUE))

# Section 8 
# Overview of syntax
# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
hflights %>% mutate(diff=TaxiOut-TaxiIn) %>% summarize(avg=mean(diff, na.rm=T))

# Drive or fly? Part 1 of 2
# Chain together mutate(), filter() and summarize()
names(hflights)
hflights %>% mutate(RealTime=ActualElapsedTime+100, mph=60*Distance/RealTime) %>% filter(!is.na(mph),mph<70) %>% summarise(n_less=n(), n_dest=n_distinct(Dest), min_dist=min(Distance),max_dist=(max(Distance)))

# Drive or fly? Part 2 of 2
# Finish the command with a filter() and summarize() call
hflights %>%
  mutate(
    RealTime = ActualElapsedTime + 100, 
    mph = 60 * Distance / RealTime
  ) %>% filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>% summarise(n_non = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))

# Advanced piping exercise
# hflights and dplyr are loaded

# Count the number of overnight flights
hflights %>% filter(!is.na(DepTime),!is.na(ArrTime), DepTime>ArrTime) %>% summarize(num=n())