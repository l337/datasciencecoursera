complete <- function(directory, id = 1:332) {
    cases <- numeric()
    rowz <- numeric()
    for (i in id) {
        readCSV <- c(read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = "")))
        cases[i] <- sum(complete.cases(readCSV))
        rowz <- rbind(rowz, data.frame(id=i, nobs=na.omit(cases[i])))
    }
    as.data.frame(rowz)
}