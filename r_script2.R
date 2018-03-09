
#### Lists in R section

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


#### list

rl1 <- util %>% filter(Machine == "RL1")

rl1 %>% filter(!is.na(Percent.Idle)) %>% summarise(min.rl1 = min(Utilization))
rl1 %>% filter(!is.na(Percent.Idle)) %>% summarise(min.rl1 = mean(Utilization))
rl1 %>% filter(!is.na(Percent.Idle)) %>% summarise(min.rl1 = max(Utilization))

rl1 %>% filter(!is.na(Percent.Idle)) %>% filter(Utilization < 0.90) %>% count()


