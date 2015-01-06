# Question One: extracting data from CSV
if(!file.exists("data")) { dir.create("data") }

library(dplyr)
fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileCsvURL, destfile="./data/idahohousing.csv", method="curl")

dateDownloaded <- date()
dateDownloaded

housingData <- read.csv("./data/idahohousing.csv")
data <- tbl_df(housingData)
propertyValues <- select(data, !is.na(VAL))
questionOne <- filter(propertyValues, VAL >= 24) #24. 1,000,000+ Net Value on house
nrow(questionOne)
# END Question One

# Question Two is a tidy data question

# Question Three: extracting data from Excel
library(xlsx)
fileExcelURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileExcelURL, destfile="./data/naturalGasAquisitionProgram.xlsx", method="curl")

dat <- read.xlsx("./data/naturalGasAquisitionProgram.xlsx", sheetIndex=1, colIndex=7:15, rowIndex=18:23)
sum(dat$Zip*dat$Ext, na.rm=T)
# END Question Three

# Question Four: extracting data from XML
library(RCurl)
library(XML)
# bypassing https, instead of removing the s:
fileXmlURL <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", ssl.verifypeer = FALSE)
doc <- xmlTreeParse(fileXmlURL, useInternal=T)
rootNode <- xmlRoot(doc)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes == 21231)
# END Question Four

# Question Five


# END Question Five