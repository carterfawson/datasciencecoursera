#The package that you need to use in order to download json into R is the jsonlite package
#install.packages("jsonlite")
library(jsonlite)

#This just uploads it right into a dataframe. Or in this instance a dataframe of dataframes! It's quite nice to deal with!
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

names(jsonData$owner)

jsonData$owner$url

#You can also output a dataframe into JSON format using the toJSON function. That could be used for making apis and things like that.
myJson <- toJSON(iris, pretty=TRUE)
cat(myJson)
