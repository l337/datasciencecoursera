rankall <- function(outcome, num="best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    ## For each state, find the hospital of the given rank
    outcome <- switch(outcome, 
                      "heart attack" = 11, 
                      "heart failure" = 17,
                      "pneumonia" = 23)
    values <- suppressWarnings(as.numeric(data[,outcome]))
    newdata <- data.frame(hospital=data$Hospital.Name, state=data$State, causeofdeath=values)
    newerdata <- newdata[order(newdata$causeofdeath, newdata$hospital, na.last=NA),]
    #newerdata <- split(newdata, newdata$state)
    if(num == "best") {
        result <- aggregate(newerdata, by = list(newerdata$state), function(x) head(x,1))
    } else if(num == "worst") {
        result <- aggregate(newerdata, by = list(newerdata$state), function(x) tail(x,1))
    } else {
        rank <- as.numeric(num)
        result <- aggregate(newerdata, by = list(newerdata$state), function(x) x[rank])
    }
    data.frame(hospital=result$hospital, state=result$state)
}