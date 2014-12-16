best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state and outcome are valid
    checkstate <- data[,7]
    statevalid <- match(state, checkstate)
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    outcomevalid <- match(outcome, outcomes)
    heartattack <- as.numeric()
    
    if(is.na(statevalid)) {
        stop("invalid state");
    } else if(is.na(outcomevalid)) {
        stop("invalid outcome")
    } else {
        subregion <- subset(data, data$State==state)
        if(outcome == outcomes[1]) {
            heartvalues <- suppressWarnings(as.numeric(na.omit(subregion$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)))
        } else if(outcome == outcomes[2]) {
            heartvalues <- suppressWarnings(as.numeric(na.omit(subregion$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)))
        } else {
            heartvalues <- suppressWarnings(as.numeric(na.omit(subregion$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)))
        }
        newerlist <- list(name=subregion$Hospital.Name, values=heartvalues)
        elem <- match(min(newerlist$values, na.rm=T), newerlist$values)
        newerlist$name[elem]
    }
}