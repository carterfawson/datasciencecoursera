setwd("~/datasciencecoursera/getclean_data/course_project/")
library(dplyr)

#Load in activities

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

#Load in features

features_data <- read.table("UCI HAR Dataset/features.txt")

# Grab desired features

features <- grep('mean[^A-Z]+|.*std.*', features_data$V2)
features.names <- features_data[features,2]

# Get rid of all hyphens and parentheses in variable names in the variable names
features.names = gsub('-mean', 'Mean', features.names)
features.names = gsub('-std', 'Std', features.names)
features.names <- gsub('[-()]', '', features.names)

#Load in the activities

trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")

trainActivities_df <- data.frame(matrix(unlist(trainActivities), byrow = TRUE, nrow = 7352))

colnames(trainActivities_df) <- c('Activities')

#Now I am going to convert the numbers into activity names

activity_sub <- function(activities){
  activities$Activities <- gsub(1, "WALKING", activities$Activities)
  activities$Activities <- gsub(2, "WALKING_UPSTAIRS", activities$Activities)
  activities$Activities <- gsub(3, "WALKING_DOWNSTAIRS", activities$Activities)
  activities$Activities <- gsub(4, "SITTING", activities$Activities)
  activities$Activities <- gsub(5, "STANDING", activities$Activities)
  activities$Activities <- gsub(6, "LAYING", activities$Activities)
  return(activities)
}

trainActivities_df <- activity_sub(trainActivities_df)

#load in the subjects

trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

trainSubjects_df <- data.frame(matrix(unlist(trainSubjects), byrow = TRUE, nrow = 7352))

colnames(trainSubjects_df) <- c('Subjects')

#Load in the observations

train <- read.table("UCI HAR Dataset/train/X_train.txt")[features]

train_df <- data.frame(matrix(unlist(train), byrow = TRUE, nrow = 7352))

colnames(train_df) <- features.names

#Connect all the training dfs into one CLEANED training df

training_clean <- cbind(trainSubjects_df, trainActivities_df, train_df)

#Now do the same things for the test set

#Load in the activities

testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")

testActivities_df <- data.frame(matrix(unlist(testActivities), byrow = TRUE, nrow = 2947))

colnames(testActivities_df) <- c('Activities')

#Now I am going to convert the numbers into activity names

activity_sub <- function(activities){
  activities$Activities <- gsub(1, "WALKING", activities$Activities)
  activities$Activities <- gsub(2, "WALKING_UPSTAIRS", activities$Activities)
  activities$Activities <- gsub(3, "WALKING_DOWNSTAIRS", activities$Activities)
  activities$Activities <- gsub(4, "SITTING", activities$Activities)
  activities$Activities <- gsub(5, "STANDING", activities$Activities)
  activities$Activities <- gsub(6, "LAYING", activities$Activities)
  return(activities)
}

testActivities_df <- activity_sub(testActivities_df)

#load in the subjects

testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

testSubjects_df <- data.frame(matrix(unlist(testSubjects), byrow = TRUE, nrow = 2947))

colnames(testSubjects_df) <- c('Subjects')

#Load in the observations

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features]

test_df <- data.frame(matrix(unlist(test), byrow = TRUE, nrow = 2947))

colnames(test_df) <- features.names

#Cbind them all into one tidy test_df

test_clean <- cbind(testSubjects_df, testActivities_df, test_df)

#Now finally I just need to rbind the two dataframes and get my final dataset!

tidy_data <- rbind(training_clean, test_clean)

tidy_data <- tbl_df(tidy_data)

#I also need to create now a new summarized tidy data frame.

summary_data <- group_by(tidy_data, Subjects, Activities)
summary_data <- summary_data %>% summarise_each(funs(mean))

#These csv files were just for my own use:
#write.csv(tidy_data, "full_tidyData.csv")
#write.csv(summary_data, "tidyData.csv")

#Now I write out the data to a text file:
write.table(summary_data, "cfaw_tidydata.txt", row.names = FALSE)





