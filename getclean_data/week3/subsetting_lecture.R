#subsetting review in data frames

#This sets the seed for a random number generation
set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

#Here is the quick review of subsetting in Data Frames!
X[,1] #this selects the second column in the frame
X[,"var1"] #this selects the column with that particular name
X[1:2, "var2"] #this subsets both rows and column


#You can also subset using logical statements, which is quite nice. Basically I feel like these are just the same as numpy arrays and matrices
X[(X$var1 <= 3 & X$var3 > 11),] #this will grab all rows where the first and third columns meet the criteria given. Since it is an "and" statement both criteria have to be met
X[(X$var1 <= 3 | X$var3 > 15),] #this is basically the same but with an or statement using the "|" pipe

#Dealing with missing values in a dataframe and subsetting.
X[which(X$var2> 8),] #what this does is which returns just the indices in which the statement evaluates to true, without the NAs. If you just run it regularly the NAs will still be in the dataset.


#Next comes a sorting review. On how to sort data structures
sort(X$var1) #this returns an ascending array of the values in X$var1

sort(X$var1, decreasing = TRUE) #you can guess what this does

#Ordering a dataframe

X[order(X$var1),] #the order function will return the indices of the rows in the order by the array input into the function

#ALSO
#the plyr package is great for sorting data.frames

library(plyr)

arrange(X, var1) #this will do the same thing as what we were doing above
arrange(X, desc(var1))

#You can also add columns into dataframes very easily
X$var4 <- rnorm(5) #var4 did not exist before this time. It's pretty easy!

#there are also the "bind" commands
#examples
Y <- cbind(X, rnorm(5)) #this binds the rnorm(5) to the right of X, you can switch it around if you want it on the left most column

Z <- rbind(Y, rnorm(5)) #this will bind the rnorm as the last row





