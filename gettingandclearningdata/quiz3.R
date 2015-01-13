# Question One
library(dplyr)
fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileCsvURL, destfile="./data/idahohousing.csv", method="curl")
data <- read.csv("./data/idahohousing.csv")
selectdata <- select(data, ACR, AGS)
agricultureLogical <- selectdata[which(selectdata$ACR == 3 & selectdata$AGS == 6),]
agricultureLogical