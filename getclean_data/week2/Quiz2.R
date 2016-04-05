library(httr)
library(jsonlite)
link <- "https://api.github.com/users/jtleek/repos"

myapp <- oauth_app("github",
                   key = "3f62093f6fd25c0b242f",
                   secret = "052a42197ea75b9e0ad9a9c47edc411044d50518")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

#Whatever that code was before it did not work. I just had to go into the json myself and look for it. I had to enter an authorization code that I couldn't find and when I put in nonsense it cached it in a file and so I couldn't fix it!

library(sqldf)


