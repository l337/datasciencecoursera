ozone <- read.csv(file="quiz1/hw1_data.csv")
ozoneClean <- ozone[complete.cases(ozone),]

# retrieving column names, which their respective types
# str(ozoneClean)

# first 2 values of the CSV data file
# head(ozone, 2)

# number of rows of the CSV data file
# nrow(ozone)

# last 2 values of the CSV data file
# tail(ozone, 2)

# what are the numbers of NA values in Ozone Column?
# notin <- sum(is.na(ozone["Ozone"]))

# retrieving the mean value of Solor.R when Ozone > 31 and Temp > 90
# temp <- subset(ozoneClean, Ozone > 31 & Temp > 90)
# mean(temp$Solar.R)

# retrieving the mean value of Temp, when Month is equal to 6
# montheq <- subset(ozone, Month == 6)
# mean(montheq$Temp)