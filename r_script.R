
library(dplyr)
setwd("C:/Users/SKTelecom/Documents/data analysis/R-Data-Pre-Processing-lecture")


fin <- read.csv("future-500.csv",na.strings = c(""))
fin %>% head()

fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)

fin$Growth <- gsub("%","",fin$Growth)

str(fin)

fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Profit <- as.numeric(fin$Profit)
fin$Growth <- as.numeric(as.character(fin$Growth))



colSums(is.na(fin))
is.na(fin)
fin[!complete.cases(fin),]
fin[!complete.cases(fin$Revenue),]

fin %>% head(20)
fin[fin$Revenue == 9746272,]

fin %>% filter(Revenue == 9746272)

fin[!complete.cases(fin),]
fin[!complete.cases(fin$Employees),]

fin[is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),]

rownames(fin) <- NULL

fin_raw <- fin



fin[!complete.cases(fin$State) & fin$City == "New York","State"] <- "NY"
fin[!complete.cases(fin$State) & fin$City == "San Francisco","State"] <- "CA"

fin %>% filter(is.na(State)) %>% filter(City == "New York") %>% select(State)

fin %>% head()


fin %>% filter(!is.na(fin$Employees)) %>% group_by(Industry) %>% summarise(emp_median = median(Employees))

fin[!complete.cases(fin$Employees) & fin$Industry == "Retail","Employees"] <- 28

fin[!complete.cases(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- 80

fin[!complete.cases(fin),]


fin %>% filter(!is.na(fin$Growth)) %>% group_by(Industry) %>% summarise(growth_median = median(Growth))

fin[!complete.cases(fin$Growth) & fin$Industry == "Construction","Growth"] <- 10
fin[!complete.cases(fin$Growth) & fin$Industry == "IT Services","Growth"] <- 21
fin[!complete.cases(fin$Growth) & fin$Industry == "Health","Growth"] <- 6



