#Creating new variables lecture

#Why would we want to create new variables?
#- often times the raw data doesn't have the exact variables that we want for our analysis
#- We may want to create missing indicators
#- We usually will want to add the new variables into the data.frame that we are working with

#Another important note to go along with this is that we may often want to do transforms on the data if they have an odd distribution

setwd("/Users/cfaw/datasciencecoursera/getclean_data/week3")
restData <- read.csv("./data/restaurants.csv")

#For some reason we are learning about creating sequences, The examples are below:

s1 <- seq(1, 10, by=2) #this will create a vector with the numbers 1 - 10 incrementing by 2

s2 <- seq(1, 10, length = 3) #this will create a vector length three evenly distributing the split between 1 and 10

#For this one let's assume you have a vector x and you want to create an index for that vector so that you can loop through it
x <- c(1, 3, 4, 25, 100); seq(along = x)

#####SUBSETTING VARIABLES############

restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe) #This will show us a count of the TRUE and the FALSE in this specific column. Only 13 restaurants are in those neighborhoods

#########CREATING BINARY VARIABLES#############
#Some examples of when this might be necessary is when you want to identify which columns are wrong and which ones are right, or even based upon calculations of other columns you can determine if it is one result or the other

restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0) #this table shows that the zipWrong column matches exactly with the zipCode < 0 column


#######CREATING CATEGORICAL VARIABLES###########
#Now I am starting to see why this course is called Getting and Cleaning data. We are really getting into the cleaning data part.
#I am actually pretty excited for the course project on this one because it is going to help me out quite a bit with what I am doing at FHR right now.

restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode)) #what this is doing is splitting them all up by the quantiles that they fall into.
table(restData$zipGroups, restData$zipCode)

#Easier cutting uses the Hmisc package
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=4) #cutting actually creates a factor variable
table(restData$zipGroups)

#Creating a factor variable. I am still not quite sure why this is important. It looks like this will make it so that the variable just isn't an incrementing int, but it is different somehow...

restData$zcf <- factor(restData$zipCode)

#############FACTOR VARIABLES####################
#What makes factor variables so important? Apparently they are important because they are seen not as a continuum of variables, but as groups of possible answers
#This helps with analysis, and assigns the correct degrees of freedom when doing analysis. I will ask Dr. Topher later about it...

#levels of factor variables:

yesno <- sample(c("yes", "no"),size=10,replace=TRUE)
yesnofac <- factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")

#this next part could be super useful in analysis as well!
#You can convert the factor to numeric values, making it easier to run statistical analysis and regression

as.numeric(yesnofac) #in this case the "yes" becomes 1 and the "no" becomes 2. But it will just increment up for each level in the factor.


#############MUTATE FUNCTION###################
#This is part of the plyr package
#it makes it so that you can automatically add a new column to the dataset.

restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)

as.numeric(restData$zipGroups) #this is amazing! It really helps to create factor variables for analysis. I just have to remember what I do to transform that and keep track of it in the codebook.

###########TRANSFORMATIONS###################

#It's going to be important in doing exploratory analysis that I do transforms to see if anything models the data better. Those are usually pretty simple transforms
#So I will write below the common functions that are often used for transforms.
#
#COMMON TRANSFORM FUNCTIONS:
#
#abs(x) - Absolute Value
#sqrt(x) - Square Root
#ceiling(x) - Round up next whole number
#floor(x) - Round down next whole number
#round(x, digits=n) - round(3.475, digits=2) is 3.48
#signif(x, digits=n) - signif(3.475, digits=2) is 3.5 - significant digits
#cos(x), sin(x)
#log(x) - natural logarithm
#log2(x), log10(x) - you get it
#exp(x) - exponentiating x
#
#
#












