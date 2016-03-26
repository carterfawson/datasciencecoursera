#this is for the data.table package. It is a package similar to data.frames, but much faster when running
#analysis on larger datasets. If you have not downloaded this package yet then run
#install.packages("data.table")
library(data.table)

DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

#If you want to see all of the data tables in memory you can run this command:
tables()

#subsetting rows
DT[2,]

DT[DT$y=="a",]

#subsetting columns is different than in data.frames. There are something called expressions, which are basically functions/operations that you are passing into the data.table which then is applied to the data.table to give you processed columns.
#This stuff can be really great for summarizing data. It helps to be able to perform aggregate operations on the dataset as a whole very easily.
DT[,list(mean(x), sum(z))]

#Data tables are really great as well at adding columns. Below is an example!

DT[,w:=z^2]
#What this is doing is adding another column called "w", which will hold the value of z^2 in it.

#Something to be wary of is when assigning one data table to another data table it doesn't actually create a copy/new table. It just is a pointer to the same table in memory. So then if you make a change to one of them it will change both, since they are basically the same thing in memory.

#THIS IS REALLY COOL!!!
#You can create multiple step functions to create a new variable in a table. Below is an example of that working:

DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

#You can also do "plyr" like operations. AKA, you can evaluate a statement and based upon the result have the new column be either true or false
#below is an example of that:

DT[,a:=x>0]

#Another cool thing that you can do is group by statements in the expressions that are creating new columns.
#In the example below a new column "b" is being added. The value in b will contain the mean of x+w where a = False, and also the mean of x+w where a = True. It's a really cool way to evaluate based upon the results of a single column.

DT[,b:= mean(x+w),by=a]

#There are some special variables in data tables that allow you to do larger computations and things faster so below I will include some examples of those and some of the description as well.

#.N
#This will give you a count of the number of specific instances of a variable occur in a column that you are performing the count by.
#example:
DT2 <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT2[, .N, by=x]



#KEYS
#Keys can be added to data tables. Which can be used to subset data tables quicker and can even be used to perform joins between tables

DT <- data.table(x=rep(c("a", "b", "c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

#Here is how the joins work:
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)

#One last thing is that reading in data into a data table is nearly ten times faster than reading data into a data.frame. If you use the fread function (fast-read) then it will read into a data table and that works much much faster. So with large datasets this could make a huge difference, especially if you are working with consumer data products. The difference between a fraction of a second or ten seconds could be huge in customer satisfaction.

