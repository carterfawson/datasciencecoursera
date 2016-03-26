#read.table() function is the most common function for reading in local files
#THINGS TO REMEMBER ABOUT read.table()
#1. It loads the data into memory! So big data can cause issues
#2. Important parameters: file, header, sep, row.names, nrows
#3. Flexible and robust but requires more parameters
#4. Related: read.csv(), read.csv2()

setwd("/Users/cfaw/datasciencecoursera/getclean_data")

#default for read.table is to look for a tab delimited file, so for the csv you have to specify the delimeter
cameraData <- read.table("./data/cameras.csv", sep=",", header=TRUE)
head(cameraData)

#Another helpful piece of information is that often the errors in reading in files comes from ' and " characters in the data. You can set the quotations in a file using the quote="" meaning that there are no special quotes to take out of the data.



