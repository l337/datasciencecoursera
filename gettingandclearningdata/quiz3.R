# Question one
library(dplyr)
fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileCsvURL, destfile="./data/idahohousing.csv", method="curl")
data <- read.csv("./data/idahohousing.csv")
selectdata <- select(data, ACR, AGS)
agricultureLogical <- selectdata[which(selectdata$ACR == 3 & selectdata$AGS == 6),]
agricultureLogical
# END Question one

# Question two
library(jpeg)
filejpgURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(filejpgURL, destfile="./data/data.jpg", method="curl")
img.n <- readJPEG("./data/data.jpg", native=TRUE)
quantile(img.n, c(0.3, 0.8))
# END Question two

# Question three
library(plyr)
grossdomestic <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
educational <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(grossdomestic, destfile="./data/grossdomestic.csv", method="curl")
download.file(educational, destfile="./data/educational.csv", method="curl")

gdpdata <- read.csv("./data/grossdomestic.csv", skip=5, nrows=190, stringsAsFactors = F)
edudata <- read.csv("./data/educational.csv", stringsAsFactors = FALSE)

gdpdata <- gdpdata[,c(1, 2, 4, 5)]
colnames(gdpdata) <- c("CountryCode", "Rank", "Country.Name", "GDP.Value")

mergedData <- merge(gdpdata, edudata, by.x="CountryCode", by.y="CountryCode", all=F)
sum(!is.na(unique(mergedData$Rank)))
arrange(mergedData, desc(Rank))[13, 3]
# END Qestion three

# Question four
# high income OECD based on GDP rank
oecd <- subset(mergedData, Income.Group %in% "High income: OECD", select = c(Rank))
mean(oecd$Rank)

# high icome nonOECD based on GDP rank
nonoecd <- subset(mergedData, Income.Group %in% "High income: nonOECD", select = c(Rank))
mean(nonoecd$Rank)
# END Question four

# Question five
mergedData[, mean(Rank, na.rm = TRUE), by = Income.Group]

breaks <- quantile(dt$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedData$quantileGDP <- cut(dt$rankingGDP, breaks = breaks)
mergedData[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]


