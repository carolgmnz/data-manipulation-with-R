# Section 5
# Logical operators
# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more
filter(hflights, Distance>3000)

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c("JetBlue", "Southwest", "Delta"))

# All flights where taxiing took longer than flying
filter(hflights, TaxiOut+TaxiIn > AirTime)

# Combining tests using boolean operators
# hflights is at your service as a tbl!

# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime<500 | ArrTime>2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay>0, ArrDelay<0 )

# All flights that were cancelled after being delayed
filter(hflights, DepDelay>0 & Cancelled==1)

#Blend together what you've learned!
# hflights is already available in the workspace

# Select the flights that had JFK as their destination: c1
c1<-filter(hflights, Dest=="JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2

c2<-mutate(c1, Date= paste(c1$Year,c1$Month,c1$DayofMonth,sep="-"))

# Print out a selection of columns of c2
c2 %>% select(Date, DepTime, ArrTime, TailNum )

# Recap on select, mutate and filter
# 155 flights

# Section 6
# Arranging your data
# dplyr and the hflights tbl are available

# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc,DepDelay)

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc,CancellationCode)

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier,DepDelay)

# Reverse the order of arranging
# dplyr and the hflights tbl are available
names(hflights)
# Arrange according to carrier and decreasing departure delays
hflights %>% arrange(UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay+ArrDelay)