# Question One
if(!file.exists("data")) { dir.create("data") }
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile="./data/idahohousing.csv", method="curl")

dateDownloaded <- date()
dateDownloaded

library(dplyr)
housingData <- read.csv("./data/idahohousing.csv")
data <- tbl_df(housingData)
propertyValues <- select(data, !is.na(VAL))
questionOne <- filter(propertyValues, VAL >= 24) #24. 1,000,000+ Net Income on house
nrow(questionOne)

file2URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(file2URL, destfile="./data/naturalGasAquisitionProgram.xlsx", method="curl")
