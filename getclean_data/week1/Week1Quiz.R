setwd("/Users/cfaw/datasciencecoursera/getclean_data")
library(data.table)
library(dplyr)
library(xlsx)
library(XML)

#this is how you check for files and directories existing. If you want to look for a file then change "dir" to "file"
if(!dir.exists("data")){
  dir.create("data")
}


fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile="./data/IdahoDataQuiz.csv", method="curl")
#Get the count of all the properties valued at more than 1000000 dollars
housingData <- fread("./data/IdahoDataQuiz.csv", sep=",", header=TRUE)
housingData[housingData$VAL == 24][, .N, by=RT]

#Next I need to read in the excel file and do some things with that:


fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile="./data/NatGasQuiz.xlsx", method="curl")

#I am supposed to read in only rows 18-23 and columns 7-15 from the excel sheet, so here is how it works

colIndex = 7:15
rowIndex = 18:23
dat <- read.xlsx("./data/NatGasQuiz.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex,header=TRUE)

#then I am supposed to run this next piece of code and see what the result is:

sum(dat$Zip*dat$Ext,na.rm=T)

############################XML#####################################
#I am supposed to read in this XML data and then find out how many restaurants have zipcode 21231

#xmlTreeParse does not support https. So you can first load in the data with Rcurl if you want, or remove the s off of the https
xmlURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(xmlURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)
a <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(a == 21231)


#####################Data Table Speed##############################
#load a csv into a data table and then I am supposed to see which of all the functions takes the shortest amount of time. Although if I check in the notes I can probably just find out without having to check the times.
#So here it goes!
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile="./data/IdahoDataQuiz2.csv", method="curl")
DT <- fread("./data/IdahoDataQuiz2.csv", sep=",", header=TRUE)
print("Option A")
system.time(mean(DT$pwgtp15,by=DT$SEX))
print("Option B")
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
print("Option C")
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
print("Option D")
system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
print("Option E")
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
print("Option F")
system.time(DT[,mean(pwgtp15),by=SEX])


