# Question one: using github api to retrieve repo json
library(httr)

# hidden values, not visible for obvious reasons
apikey <- "<api key from github app>"
secret <- "<api secret from github app>"

# required for github api use
github <- oauth_endpoints("github")
myapp <- oauth_app("github", key=apikey, secret=secret)
github_token <- oauth2.0_token(github, myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# fromJSON(toJSON(messy_stuff))

# END Question one