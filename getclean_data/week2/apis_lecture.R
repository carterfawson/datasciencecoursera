#reading data from APIs
#we will use the httr package to do this like in the last lecture.
#here is how it all works through an example using the twitter api
library(httr)
library(jsonlite)

myapp = oauth_app("twitter", key="EF9xmRLon4NchXwnwT0EqRAfk", secret="q9FpaEGSXnGY9VAL33MUEOs5FGcOn5tHazoCLCvxFZuIrKDs0z")
sig = sign_oauth1.0(myapp, token="1711161398-mPAlCuRAsgHTR0yDUQ35TdzXBgDHEdsQCmVsT3d", token_secret = "EWt6JNq2uxjCcUk6qw4oykbWzLbShZM9RntnosnLAz5pB")
homeTl = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
json1 = content(homeTl)
json2 = fromJSON(toJSON(json1))
json2[2,]

#with httr you can do GET, POST, PUT, DELETE requests