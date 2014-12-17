rankhospital <- function(state, outcome, num) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character", na.strings="Not Available, NA")
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    subregion <- subset(data, data$State==state)
    subdata <- rank(subregion)
    newdata <- subdata[order(subdata$heartfailure),]
    firstvalue <- newdata[order(match(newdata$heartfailure,newdata[num,"heartfailure"])),]
    if(num > newdata$order[length(newdata)]) {
        print(NA)
    } else {
        # orders results based on match of num, returns the first result if there is a tie
        as.character(firstvalue$name[1])   
    }
    ## 30-day death rate
}

rank <- function(hospital) {
    values <- suppressWarnings(as.numeric(hospital[,17]))
    data.frame(order=1:length(values),name=hospital$Hospital.Name, state=hospital$State, heartfailure=values)
}

rankhospital("TX", "heart failure", 15)