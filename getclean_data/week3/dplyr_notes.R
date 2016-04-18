#DPLYR PACKAGE#####
#this package is really great for data manipulation and is really fast and simplifies a lot of the data manipulation process. 
#It works on the basic assumptions of a tidy dataset. Which are:
#
##THE GOAL: TIDY DATA
#
# 1. Each variable forms one column
# 2. Each observation forms a row
# 3. Each table/file stores data about one kind of observation (ie patients/hospitals)
#
#
#Dplyr works on a basic set of verbs that allow you to manipulate data frames, data tables, and data in SQL systems as well.
#DPLYR VERBS:
#
#select: return a subset of the columns of a dataset
#filter: extract a subset of rows based upon a logical condition
#arrange: reorder rows of a dataframe
#rename: rename variables in a dataframe
#mutate: add new variables/columns or modify existing ones
#summarize/summarise: generate summary statistics of different variables within the dataframe, possibly within strata

#JUST SOME NOTES:
#the group_by() function. What this does is it will group the dataframe, datatable, etc by the column that you give it so that when you give it operations to perform on the group it will now perform those operations on that group.
#this is actually really amazing! Quite nice to group on certain columns and then look at the values!


#########THIS WAS PART OF THE SWIRL TUTORIAL#################
# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# A few thing to be careful of:
#
# 1. Separate arguments by commas
# 2. Make sure you have a closing parenthesis
# 3. Check your spelling!
# 4. Store the result in pack_sum (for 'package summary')
#
# You should also take a look at ?n and ?n_distinct, so
# that you really understand what is going on.

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id), #n_distinct() function will count the number of distinct instances of the supplied variable there are. So that when this is paired with the grouped table it will give you the number of distinct ip_ids for each package.
                      countries = n_distinct(country),
                      avg_bytes = mean(size))


#########################################
#Another handy note is the function View, which will bring up a console window with a nicely formatted table with your dataset in it

########PIPING###########
#with dplyr you can actually pipe output from each action into another so that you don't have to 
#keep storing intermediary datasets in order to get to your final result.
#The only thing to really get used to here is that in stead of the | pipe you use %>% as the pipe. They say it represents the word "then".
