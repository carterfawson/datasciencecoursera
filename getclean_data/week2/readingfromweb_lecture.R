link <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

#Getting data off of webpages: 
# you can use the getlines function ->

con = url(link)
htmlCode = readLines(con)
close(con)
htmlCode

#You can also use the stuff that we learned in the XML parse stuff from last week. For example:

library(XML)
html <- htmlTreeParse(link, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

#There is a package that can be used here that is really great called the httr package. You can get information using the GET command. It's kind of like how the requests are actually processed for the website so that makes total sense
library(httr); html2 = GET(link)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

#THE COOLEST PART ABOUT THIS PACKAGE IS THAT YOU CAN USE IT TO LOG INTO WEBSITES THAT REQUIRE PASSWORDS!
fburl = "www.facebook.com"
pg2 = GET(fburl, authenticate("carteraaronfawson@gmail.com", "misionatonga"))
pg2

#there are some really cool things that can be done with this. I need to do a bit more with this so that I can be really good at website scraping.
