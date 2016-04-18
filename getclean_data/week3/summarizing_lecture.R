#So we have gone through getting data, I know how to do that now.
#Something that is incredibly important before being able to do downstream analysis
#is to clean up the data. In order for good analysis to be done the data has to be cleaned. Also don't forget to keep track of all the steps that you have to go through in order to get from raw data to tidy data

setwd("/Users/cfaw/datasciencecoursera/getclean_data/week3")
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")

head(restData, n=3)

tail(restData, n=3)

#this is really informative to help you understand what the summary statistics are for each of the columns in the dataframe. This would be really useful in exploratory analysis and for finding any inconsistencies that shouldn't be there.
summary(restData)

#This next command is just a little bit more in depth
str(restData)

#quantiles! I finally get what they are and that makes more sense as to why they are so useful. Basically they will show you the distribution of observations. With the min as the 0% and the max as the 100%
quantile(restData$councilDistrict, na.rm = TRUE) #also make sure to remove the NAs if you don't want them to be part of the data

quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9)) # this will show you the results for the three percentages that you give it

#You can make tables that have the counts for all of the variables in the set. Tomorrow I need to play around with this on the dataset from work. I need to do it at work as well, but it will be a good way to cement this into my mind.

table(restData$zipCode, useNA = "ifany") #what the useNA argument means is that if there are any NA observations it will give it it's own column in the table and a count of all the NA values as well. This will most likely be something that I want almost all the time.

#SO COOL!!!! 
#You can create a two dimensional table that will show you a breakdown of when both variables you pass in occur together.

table(restData$zipCode, restData$councilDistrict)

#here is how you can check a column for any missing values

sum(is.na(restData$councilDistrict)) #this will return the number of NA observations in that column
#or use the any command
any(is.na(restData$councilDistrict))
#the all command will tell you if all of the variables in the data meet that requirement
all(restData$zipCode > 0)

#You can also get column and row sums pretty easily

#values with specific characteristics
table(restData$zipCode %in% c("21212", "21213")) #this basically will give you totals for all of the values in restData$zipCode that are in the vector supplied

#now if I just want to get the rows that are meeting the specific guidelines above
restData[restData$zipCode %in% c("21212", "21213"),]

#Another thing that I need to look into is creating cross tabs. Which are basically like summarizing data with a few guidelines provided. below is an example but make sure to look at the output to see what it puts out

data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

#lastly, it is always good to be able to see the size of a dataset.

object.size(restData)