######MERGE DATA###########
#The basic idea for this lecture is just that we have multiple datasets that we will load in that we will want to merge. Much like a join clause in a SQL statement. We will be merging datasets ideally based upon some sort of ID

#Peer review experiment data set is what we are going to use
setwd("/Users/cfaw/datasciencecoursera/getclean_data/week3/data")

fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(fileURL1, destfile="reviews.csv", method = "curl")
download.file(fileURL2, destfile="solutions.csv", method = "curl")

reviews = read.csv("reviews.csv"); solutions <- read.csv("solutions.csv")

#So in these two dataframes we are going to merge solution_id from reviews with id from solutions
#the important parameters for the merge function are like this merge(x,y,by,by.x,by.y,all). I will explain each:
#x - the first dataframe
#y - the second dataframe
#by - This is used to tell it what to merge on. By default it will look for common column names in common which can be dangerous sometimes.
#by.x - this will specify the exact column in x that you will be merging on
#by.y - this will specify the exact column in y that you will be merging on
#all - this is basically the same thing as specifying inner joins and outer joins, or left joins and right joins, in SQL. I haven't used that much in the past but who knows if I will in the future. Good to write it down so that I can know for the future.

#EXAMPLE:

mergedData <- merge(reviews, solutions, by.x = "solution_id", by.y = "id", all=TRUE)
head(mergedData)

#DEFAULT is to merge on all similar column names. Which as I said earlier could cause issues so here is a little trick to see what column names are similar:

intersect(names(reviews), names(solutions)) #this just gives you all of the things that are in common between the two vectors that are supplied to the function

#The plyr package has a join() function, it is a bit faster but it is not full featured
#BIG ISSUE WITH IT!!! You can only merge on common column names between datasets. You cannot specify row names to merge on. Merge has a lot more functionality

  