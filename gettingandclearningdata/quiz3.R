# Question One
library(dplyr)
fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileCsvURL, destfile="./data/idahohousing.csv", method="curl")
data <- read.csv("./data/idahohousing.csv")
selectdata <- select(data, ACR, AGS)
agricultureLogical <- selectdata[which(selectdata$ACR == 3 & selectdata$AGS == 6),]
agricultureLogical

# Question Two
library(jpeg)
filejpgURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(filejpgURL, destfile="./data/data.jpg", method="curl")
img.n <- readJPEG("./data/data.jpg", native=TRUE)
quantile(img.n, c(0.3, 0.8))

# Question Three
grossdomestic <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
educational <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(grossdomestic, destfile="./data/grossdomestic.csv", method="curl")
download.file(educational, destfile="./data/educational.csv", method="curl")

domesticgrossdata <- read.csv("./data/grossdomestic.csv")
educationaldata <- read.csv("./data/educational.csv")

mergedData <- merge(domesticgrossdata, educationaldata, by.x="X", by.y="CountryCode")
sorteddata <- arrange(mergedData, desc(Gross.domestic.product.2012))
sorteddata[13,]

# str(domesticgrossdata)
# names(educationaldata)