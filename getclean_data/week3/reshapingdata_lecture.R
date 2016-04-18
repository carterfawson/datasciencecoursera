##Reshaping data
#often times the data that you get is not tidy, and not in the right shape that you need it.

#THE GOAL: TIDY DATA
#
# 1. Each variable forms one column
# 2. Each observation forms a row
# 3. Each table/file stores data about one kind of observation (ie patients/hospitals)
#

#####USE THE reshape2 LIBRARY!!!

library(reshape2)
head(mtcars)

#MELTING DATA FRAMES#
#I am trying to think of a good use for this. It basically changes the columns, makes the dataset smaller but I don't yet see a use for preparing the dataset for 
#analysis.

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
carMelt2 <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars = c("hp"))
head(carMelt, n=3)

tail(carMelt, n=3)

##CASTING DATA FRAMES######
#I need to think of a use case for a dataset like this as well.

cylData <- dcast(carMelt, cyl ~ variable) #this kind of consolidates the datasets and defaults to counts... in this case by the different cyl counts. It shows how many observations for each on the cyl sizes.
cylData

cylData <- dcast(carMelt, cyl ~ variable, mean) #this shows the mean for all of the entries grouped on the cyl sizes.
cylData

dcast(mtcars, cyl ~ hp, mean)

###Averaging Values###
tapply(InsectSprays$count, InsectSprays$spray, sum) #The apply functions are really great because they apply a function across a vector.

####SPLIT FUNCTION IS REALLY COOL IN R#####
#Basically what it does is it takes in two columns of a dataframe and then will group them together creating a new vector for each of the unique items in the second entry

spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns

#NEXT STEP
#use the lapply function, which I am now understanding when I was having such a hard time understanding that last year! Thank you Dr. Kulyukin for enlightening me in the ways of Computer Science!
sprCount <- lapply(spIns, sum) #this applies the function to each element of the list. It's a great way to not have to loop through something.
sprCount

#the only thing is the lapply will leave it in a list, but we want to return it to a vector. So you can do this:
unlist(sprCount)

#or if we just use sapply to begin with then we won't have to use the unlist function
sprCount <- sapply(spIns, sum)

#Another way is with the plyr package!
####PLYR PACKAGE#######
ddply(InsectSprays, .(spray), summarize, tots=sum(count)) #this one will also return a data frame back to you with the spray and the total next to it

