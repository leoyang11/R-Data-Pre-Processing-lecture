
library(dplyr)


#### load dataset
util <- read.csv("Machine-Utilization.csv")
str(util)
summary(util)

#### derive utilization column
util <- util %>% mutate(Utilization = 1 - Percent.Idle)

#### handling date-times
util$PosixTime <- as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
util %>% head()


