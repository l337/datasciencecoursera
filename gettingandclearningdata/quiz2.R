# Question one: using github api to retrieve repo json
library(httr)
library(jsonlite)

# hidden values, not visible for obvious reasons
apikey <- "<20 character hidden API Key>"
secret <- "<40 character hidden secret>"
repoName <- "datasharing"

# required for github api use
github <- oauth_endpoints("github")
myapp <- oauth_app("github", key=apikey, secret=secret)
github_token <- oauth2.0_token(github, myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
jsonObject <- fromJSON(toJSON(content(req)))
createdAt <- jsonObject$created_at[jsonObject$name == repoName]
createdAt
# END Question one

# Question two, select only the data for the probability weights pwgtp1 with ages less than 50
library(sqldf)

fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileCsvURL, destfile="./data/americancommunitysurvey.csv", method="curl")
acs <- read.csv.sql("./data/americancommunitysurvey.csv")
results <- sqldf("select pwgtp1 from acs where AGEP < 50")
# END Question two

# Question three
runique <- unique(acs$AGEP)
sqlunique <- sqldf("select distinct AGEP from acs")
# END Question three

# Question four
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con)
close(con)
c(nchar(htmlCode)[10], nchar(htmlCode)[20], nchar(htmlCode)[30], nchar(htmlCode)[100])
# End Question four

# Question five
fileFixWidthURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileFixWidthURL, destfile="./data/fixedwitdhfile.for", method="curl")
fwf <- read.fwf('./data/fixedwitdhfile.for', widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(fwf[,4])
# END Question five