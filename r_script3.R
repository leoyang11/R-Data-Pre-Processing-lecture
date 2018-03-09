
#### Apply Family of Functions section
library(dplyr)
library(reshape2)

# Read data
Chicago <- read.csv("./Weather Data/Chicago-F.csv", row.names = 1)
NewYork <- read.csv("./Weather Data/NewYork-F.csv", row.names = 1)
Houston <- read.csv("./Weather Data/Houston-F.csv", row.names = 1)
SanFrancisco <- read.csv("./Weather Data/SanFrancisco-F.csv", row.names = 1)

# Convert to matrix
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

# put all of these into a list
Weather <- list(Chicago = Chicago, NewYork = NewYork, Houston=Houston, SanFrancisco = SanFrancisco)
Weather

# Lets try it out
Weather[3]
Weather[[3]]
Weather$Houston

# use apply()
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

Chicago
Chicago[1,]
t(Chicago)

# lapply1
Weather
lapply(Weather, t)

# lapply2
Chicago
Chicago %>% rbind(NewRow = 1:12)
lapply(Weather, rbind, Newrow = 1:12)

# lapply3
rowMeans(Chicago)
lapply(Weather, rowMeans)
lapply(Weather, colSums)

# lapply with the []
Weather
Weather$Chicago[1,1]
Weather[[1]][1,1]

lapply(Weather,"[",1,1)
lapply(Weather,"[",1,)
lapply(Weather,"[",,3)

# adding your own functions
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])
lapply(Weather, function(x) x[5,12])
lapply(Weather, function(z) z[1,] - z[2,])

# sapply
lapply(Weather, "[", 1, 7)
sapply(Weather, "[", 1, 7)

lapply(Weather, "[", 1, 10:12)
sapply(Weather, "[", 1, 10:12)

lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans),2)

lapply(Weather, function(z) z[1,] - z[2,])
sapply(Weather, function(z) z[1,] - z[2,])
t(sapply(Weather, function(z) z[1,] - z[2,]))

# nesting apply function
apply(Chicago, 1, max)
lapply(Weather, apply, 1, max)

sapply(Weather, apply, 1, max)


