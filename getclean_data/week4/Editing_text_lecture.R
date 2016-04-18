#This lecture is about editing text variables so that they are clean and easy to use

setwd("/Users/cfaw/datasciencecoursera/getclean_data/week4")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

#You might want to make lowercase all of the column names so that you don't mistype it ever
tolower(names(cameraData))

#You can also fix variables using the strsplit method
splitnames <- strsplit(names(cameraData), "\\.")
#now you can see that it didn't change some:
splitnames[[5]]
#but it did change others
splitnames[[6]]

#So here we are working with lists. Which are not exactly the same as the lists in Python. Here is what the documentation says about R lists:
# A list is a generic vector containing other objects.
#It is in a list that we use the double bracket notation to get the actual elements and change them. If you just use single bracket notation then you are just grabbing a slice of the list, and not the actual vector inside the list itself.

#Now we will use a function that will modify our whole list with the splitstring

firstelement <- function(x){x[1]}
sapply(splitnames, firstelement)

#Another string formatting method that you may want to use is the sub command. This will substitute a specified character or set of characters with another specified character.

#For example, if I wanted to replace that . in Location.1 with an underscore, here is how I would do it:

sub("\\.", "_", names(cameraData)) #remember to escape the . because it will match anything in regex notation

# A drawback of using sub is that it will only replace the first instance of the matching character.
# If you want to replace multiple then you will have to use gsub.
# Let's replace the letter s for example:

gsub("s", "b", names(cameraData))

# How about finding values? use the grep and grepl functions!

grep("Alameda", cameraData$intersection)
#this returns all of the row indexes that have Alameda in the intersection column

# The grepl command will go through and return true or false based upon whether or not each item appears
grepl("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))

#Just a hot tip! If you want to see if anything was returned from the grep you can look for the length of the returned vector. If the length is 0 then there were no matches!

# You can also get the values returned from the grep function as well:
grep("Alameda", cameraData$intersection, value=TRUE)

#Here are just a few useful string functions (some of them are in the stringr package):
library(stringr)

nchar("Carter Fawson")

substr("Carter Fawson", 7, 10)

paste("Carter", "Fawson") #this will put a space between the two variables

paste0("Carter", "Fawson") #this will put not space between the two

str_trim("Carter             ") #this will chop all of the whitespace off of the variable (This would actually be useful quite often and I might use this in my analysis for on call)

