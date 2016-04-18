#Quiz 4

#setwd("~/datasciencecoursera/getclean_data/week4/data")

#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(fileURL, "CommunitySurvey.csv", method = "curl")

#Idaho_data = read.csv("CommunitySurvey.csv")

#Question 1.
split_names <- strsplit(names(Idaho_data), "wgtp")
split_names[[123]]

#Question 2.
#I FIGURED IT OUT! THERE ARE A BUNCH OF SUMMARY STATS AT THE END OF THE DATASET!!!

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, "GDP.csv", method = "curl")

GDP_data <- read.csv("GDP.csv", skip=4, stringsAsFactors=FALSE)

library(dplyr)

clean_data <- filter(GDP_data, X.3 != "")
clean_data <- clean_data[1:214,]
GDPs <- sapply(gsub(",", "", clean_data$X.4), as.numeric)
mean(GDPs, na.rm = TRUE)

#Question 3
grep("^United",GDP_data$X.2, value=TRUE)

#Question 4
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDSTATS_Country.csv")
download.file(url, f)
dtEd <- data.table(read.csv(f))
dt <- merge(dtGDP, dtEd, all=TRUE, by=c("CountryCode"))
isFiscalYearEnd <- grepl("fiscal year end", tolower(dt$Special.Notes))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd, isJune)
dt[isFiscalYearEnd & isJune, Special.Notes]

#Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

length(sampleTimes[year(sampleTimes) == 2012])

length(weekdays(sampleTimes[year(sampleTimes) == 2012])[weekdays(sampleTimes[year(sampleTimes) == 2012]) == "Monday"])