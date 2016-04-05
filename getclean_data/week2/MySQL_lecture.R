#They want me to install MySQL on my machine. I wonder if I will have to use it for a project. I mean it's not a bad idea so that I don't have to use the AWS versions.
#I did install it on my local machine, and I put a database on root. I need to create a user...
'''
Database location: 127.0.0.1
Database name: DataScience_Dev
Database user: cfawdev
User Password: Ngaue1992
'''
library(RMySQL)
#In the lecture we are going to be using an online database that they share with us
#As a 

#connecting to genome database

ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu", db="hg19")
result <- dbGetQuery(ucscDb, "show databases;")

#make it a good habit of closing the connection using this command
dbDisconnect(ucscdB)

allTables <- dbListTables(hg19)
length(allTables)

#getting the dimensions of a specific table

dbListFields(hg19,"affyU133Plus2")

#This is getting a rowcount
dbGetQuery(hg19, "SELECT count(*) FROM affyU133Plus2")

#extracting a table and assigning it to a dataframe. This is really handy! I should do this for FHR and automating on call
affyData <- dbReadTable(hg19, "affyU133Plus2")

#Tables are usually YUUUUGE
#So here is how to get a query set into a dataframe

query <- dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches between 1 AND 3;")
affyMis <- fetch(query)

#This is a sidenote that doesn't have to do with getting data from SQL, but getting the quantiles:
quantile(affyMis$misMatches)

#This next example would bring back only the top ten records. So you don't download the whole table into memory
affyMisSmall <- fetch(query, n=10)

#After using this way you need to clear the query. This is because you basically still have a cursor open up in the shell of the MySQL instance so you have to clear that in order to perform further queries and things
dbClearResult(query)

#connecting to local instance

myDB <- dbConnect(MySQL(), user="cfawdev", host="127.0.0.1", password="Ngaue1992")
result2 <- dbGetQuery(myDB, "show databases;"); dbDisconnect(myDB)


