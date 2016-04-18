#Quiz for week 3

#using the which() function

setwd("/Users/cfaw/datasciencecoursera/getclean_data/week3/data")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "idahoData.csv", method = "curl")
idaho_data <- read.csv("idahoData.csv")


#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products.

agricultureLogical <- (idaho_data$ACR == 3 & idaho_data$AGS == 6)

which(agricultureLogical) #The which function will return the indices of all the objects that are TRUE in a logical vector


#QUESTION #2
#Deals with the jpeg package, so make sure that you download that package first
library(jpeg)

#first download the picture:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "jeff.jpg", method = "curl")
jpeg_pic <- readJPEG("jeff.jpg", native = TRUE)
quantile(jpeg_pic, probs = c(.3, .8))


##QUESTION 3
#Load in two datasets then do a merge and some filtering

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv", method = "curl")
GDPdata <- read.csv("GDP.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "education_data.csv", method = "curl")
EducationData <- read.csv("education_data.csv")

#getting the number of matches between the columns
library(dplyr)

GDP <- tbl_df(GDPdata)
Edu <- tbl_df(EducationData)

GDP <- filter(GDP, X != "")

mergedData <- merge(GDP, Edu, by.x = "X", by.y = "CountryCode", all = TRUE)

mergedData <- tbl_df(mergedData)

mergedData <- filter(mergedData, mergedData$Gross.domestic.product.2012 != "")

finalData <- arrange(rename(mergedData, FullName = X.2, CountryCode = X, GDP_rank = Gross.domestic.product.2012), desc(GDP_rank))

finalData <- group_by(finalData, Income.Group)



