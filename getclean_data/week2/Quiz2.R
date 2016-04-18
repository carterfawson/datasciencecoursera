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

setwd("/Users/cfaw/datasciencecoursera/getclean_data/week2")
acs <- read.table("./data/getdata-data-ss06pid.csv", sep=",", header=TRUE)
head(acs)

#######Reading in basic html
link2 <- "http://biostat.jhsph.edu/~jleek/contact.html"
con = url(link2)
htmlCode = readLines(con)
close(con)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

####reading the fixed width text file. looks like others put it on stack overflow.
#apparently regexes are used.

x <- read.fwf(
  file="./data/getdata-wksst8110.for",
  skip=4,
  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(x)

sum(x[,4])

