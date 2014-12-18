rankhospital <- function(state, outcome, num="best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available, NA")
    ## Check that state and outcome are valid
    checkstate <- data[,7]
    statevalid <- match(state, checkstate)
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    outcomevalid <- match(outcome, outcomes)
    
    if(is.na(statevalid)) {
        stop("invalid state");
    } else if(is.na(outcomevalid)) {
        stop("invalid outcome")
    } else {
        subregion <- subset(data, data$State==state)
        subdata <- rank(subregion, outcome)
        newdata <- na.omit(subdata[order(subdata$causeofdeath, subdata$name),])
        
        # if num is outside the length of the data there shouldn't be any data for that result
        if(is.numeric(num) & num > length(newdata$name)) {
            print(NA)
        } else {
            if(num == "best") {
                as.character(newdata$name[1])
            } else if(num == "worst") {
                as.character(newdata$name[length(newdata$name)])
            } else {
                as.character(newdata[num,'name'])   
            } 
        }
    }
}

# picks correct column based on outcome/state returns a dataframe with all apporiate data
rank <- function(hospital, columnresult) {
    outcome <- switch(columnresult, 
                      "heart attack" = 11, 
                      "heart failure" = 17,
                      "pneumonia" = 23)
    values <- suppressWarnings(as.numeric(hospital[,outcome]))
    data.frame(order=1:length(values),name=hospital$Hospital.Name, state=hospital$State, causeofdeath=values)
}