rankhospital <- function(state, outcome, num) {
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
        # sorted data from lowest to highest
        newdata <- subdata[order(subdata$heartfailure),]
    }
    
    if(num == "best") {
        
    } else if(num == "worst") {
        
    } else {
        firstvalue <- newdata[order(match(newdata$heartfailure,newdata[num,"heartfailure"])),]
    }
    
    # if num is outside the length of the data there shouldn't be any data for that result
    if(num > newdata$order[length(newdata)]) {
        print(NA)
    } else {
        # orders results based on match of num, returns the first result if there is a tie
        as.character(firstvalue$name[1])   
    }
    ## 30-day death rate
}

# picks correct column based on outcome/state returns a dataframe with all apporiate data
rank <- function(hospital, columnresult) {
    outcome <- switch(columnresult, 
                      "heart attack" = 11, 
                      "heart failure" = 17,
                      "pneumonia" = 23)
    values <- suppressWarnings(as.numeric(hospital[,outcome]))
    data.frame(order=1:length(values),name=hospital$Hospital.Name, state=hospital$State, heartfailure=values)
}

rankhospital("TX", "heart failure", 15)