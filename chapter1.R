# Section 1

# Load the dplyr and hflights package
# Load the dplyr package
library(dplyr)

# Load the hflights package
library(hflights)

# Call both head() and summary() on hflights
head(hflights)
summary(hflights)

# Explore the data set
# hflights consists of 227496 observations and 21 variables.

# Section 2
# Convert data.frame to tibble
# Both the dplyr and hflights packages are loaded
hflights_df <- hflights
# Convert the hflights_df data.frame into a hflights tbl
hflights <- as_tibble(hflights_df)

# Display the hflights tbl
hflights

# Create the object carriers
carriers <- hflights$UniqueCarrier

# Changing labels of hflights, part 1 of 2
# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)

# Changing labels of hflights, part 2 of 2
# The hflights tbl you built in the previous exercise is available in the workspace.

# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Add the Code column
hflights$Code <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)