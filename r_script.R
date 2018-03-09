
#### Data Preparation section

library(dplyr)
setwd("C:/Users/SKTelecom/Documents/data analysis/R-Data-Pre-Processing-lecture")

#### import data
fin <- read.csv("future-500.csv",na.strings = c(""))
fin %>% head()

#### change data format
fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)

fin$Growth <- gsub("%","",fin$Growth)

str(fin)

#### change data type
fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Profit <- as.numeric(fin$Profit)
fin$Growth <- as.numeric(as.character(fin$Growth))

#### check missing value
colSums(is.na(fin))
is.na(fin)

#### list up rows containing missing value
fin[!complete.cases(fin),]
fin[!complete.cases(fin$Revenue),]

#### make backup data
fin_raw <- fin

#### insert missing value #1. direct input
fin[!complete.cases(fin$State) & fin$City == "New York","State"] <- "NY"
fin[!complete.cases(fin$State) & fin$City == "San Francisco","State"] <- "CA"

#### insert missing value #2. median input

## Employees:: calculate median except missing value
fin %>% filter(!is.na(fin$Employees)) %>% group_by(Industry) %>% summarise(emp_median = median(Employees))

## Employees:: insert median value
fin[!complete.cases(fin$Employees) & fin$Industry == "Retail","Employees"] <- 28
fin[!complete.cases(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- 80

## Growth:: calculate median except missing value
fin %>% filter(!is.na(fin$Growth)) %>% group_by(Industry) %>% summarise(growth_median = median(Growth))

## Growth:: insert median value
fin[!complete.cases(fin$Growth) & fin$Industry == "Construction","Growth"] <- 10
fin[!complete.cases(fin$Growth) & fin$Industry == "IT Services","Growth"] <- 21
fin[!complete.cases(fin$Growth) & fin$Industry == "Health","Growth"] <- 6

#### check missing value
fin[!complete.cases(fin),]

## Revenue:: calculate median except missing value
fin %>% filter(!is.na(fin$Revenue)) %>% group_by(Industry) %>% summarise(rev_median = median(Revenue))
## Revenue:: insert median value
fin[!complete.cases(fin$Revenue) & fin$Industry == "Construction","Revenue"] <- 9055058

## Expenses:: calculate median except missing value
fin %>% filter(!is.na(fin$Expenses)) %>% group_by(Industry) %>% summarise(exp_median = median(Expenses))
## Expenses:: insert median value
fin[!complete.cases(fin$Expenses) & fin$Industry == "Construction","Expenses"] <- 4506976

#### check missing value
fin[!complete.cases(fin),]

## Profit:: Revenue - Expenses
fin[!complete.cases(fin$Profit),"Profit"] <- fin[!complete.cases(fin$Profit),"Revenue"] - fin[!complete.cases(fin$Profit),"Expenses"]

## Expenses:: Revenue - Profit
fin[!complete.cases(fin$Expenses),"Expenses"] <- fin[!complete.cases(fin$Expenses),"Revenue"] - fin[!complete.cases(fin$Expenses),"Profit"]








