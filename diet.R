weightmedian <- function(directory, day=1) { 
    files_list <- list.files(directory, full.names=T)
    data <- data.frame()
    for (i in 1:5) {
        data <- rbind(data, read.csv(files_list[i]))
    }
    data_subset <- data[which(data[,"Day"] == day),]
    median(data_subset[,"Weight"], na.rm=T)
}
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)