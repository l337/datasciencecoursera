best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
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
        ## Return hospital name in that state with lowest 30-day death
        ## rate
    }
}
best("NY", "heart attack")