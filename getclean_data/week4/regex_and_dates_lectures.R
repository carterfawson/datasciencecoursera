#Regular Expressions:
# I am happy with this because I already have a pretty good grasp of regexes and the way they function
# So once I get the syntax down I will be able to use regexes very quickly and easily withing the scope of this class

# You use regular expressions with the grep, grepl, sub, and gsub functions from the last lecture. That's good to know, grep basically is just the match function that will then allow you to extract your matched values

########## I Guess There wasn't much to type out for Regexes, so I will also put the working w/ dates in this file as well ###############

# Working with dates

d1 = date() #the date function actually just returns a character with the date and time. Not a date object

d1

d2 = Sys.Date() #this will actual create a date variable.

d2

#Formatting dates can be pretty difficult so here is how you can format a date object in R:
#Here are the different formatting keys
# - %d is day in number (1-31)
# - %a abbreviated weekday
# - %A unabbreviated weekday
# - %m month number (1-12)
# - %b abbreviated month
# - %B unabbreviated month
# - %y two digit year
# - %Y four digit year

#Examples:

format(d2, "%m/%d/%y")

#Creating dates from character vectors:

x = c("1jan1960", "31mar1994", "14aug2007"); z = as.Date(x, "%d%b%Y")

z[1] - z[2] #This returns a wacky string telling me how many days apart these two are

as.numeric(z[1] - z[2]) #This will just return the difference in days between the two

#Getting parts out of a date object:

weekdays(d2)

months(d2)

julian(d2)

#You can also use the lubridate package for even easier date conversion
library(lubridate)
#examples of using this package:

ymd("20120808") #with this package you don't have to format the dates in any way. This one stands for year month day

mdy("09-21-89")

#you can deal with time as well

ymd_hms("20120808123437")
#OR
ymd_hms("2012-08-08 12:34:37")
#You can even specify timezones!
ymd_hms("2012-08-08 12:34:37", tz="Pacific/Auckland")

#look into system timezones as well
?Sys.timezone
#You can change this if needed



