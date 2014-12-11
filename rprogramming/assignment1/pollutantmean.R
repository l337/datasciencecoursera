pollutantmean <- function(directory, pollutant, id = 1:332) {
    data <- numeric()
    for (i in id) {
        readCSV <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
        data <- c(data, readCSV[[pollutant]])
    }
    mean(data, na.rm = T)
}