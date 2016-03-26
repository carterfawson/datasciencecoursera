#There is a library that you use when you are working with Excel spreadsheet files
#If you do not already have the library installed then make sure you execute this command:
#install.packages("xlsx")
setwd("/Users/cfaw/datasciencecoursera/getclean_data")
library(xlsx)

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileURL, destfile="./data/cameras.xlsx", method="curl")

cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)

#With Excel files you can also specify columns and rows that you want to read in if there are some that you want to exclude out of your analysis
#here is how you do that

colIndex <- 2:3
rowIndex <- 1:4

lim_cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex,header=TRUE)
lim_cameraData

#also if you want to write out to an excel file, which honestly would be incredible useful in almost any
#business environment then here is how you would do it. At least in my experience most business people
#are wizards with excel

write.xlsx(cameraData, "./data/camerawrite.xlsx", sheetName = "Sheet1", col.names = TRUE, row.names = TRUE, append = TRUE)

#Most of the arguments have default values and you can just write the function down in RStudio and it will pull up a prompt for you with the arguments
