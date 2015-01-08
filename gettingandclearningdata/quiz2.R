# Question one: using github api to retrieve repo json
library(httr)
library(jsonlite)

# hidden values, not visible for obvious reasons
apikey <- "<20 character length hidden key>"
secret <- "<40 character length hidden secret>"
repoName <- "datasharing"

# required for github api use
github <- oauth_endpoints("github")
myapp <- oauth_app("github", key=apikey, secret=secret)
github_token <- oauth2.0_token(github, myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
# stop_for_status(req)
# content(req)
jsonObject <- fromJSON(toJSON(content(req)))
createdAt <- jsonObject$created_at[5]
createdAt
# END Question one

# Question two
fileCsvURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileCsvURL, destfile="./data/americancommunitysurvey", method="curl")
data <- read.csv("./data/idahohousing.csv")
data


# END Question two