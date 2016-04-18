# Getting and Cleaning Data Project

The raw data for this project comes from accelerometers on the Samsung Galaxy S smartphone. The goal of this project was to create a tidy dataset from the original raw data and submit it for review by my peers. In this repo you will find the script called run_analysis.R I used to convert the data into it's tidy format as well as two csv files with the tidy data:

* full_tidyData.csv: this is the entire cleaned dataset before finding the means for each person and activity
* tidyData.csv: this is the summarized dataset, grouped by person and activity

###Here is the process I used to get to my final datasets.
####All of these steps are well documented in the run_analysis.R script
  1. Load in activities
  
  2. Load in the features
  
  3. grab desired features
  
  4. load in the activities file and convert activities numbers to names
  
  5. load in the subjects
  
  6. load in the observations

  7. replace observation headers with features
  
  8. subset observations based upon desired features
  
  9. cbind all the datasets into one
  
  10. perform steps 4-9 on test data
  
  11. rbind training and test data
  
  12. perform the summarizing of the data(probably using dplyr and group_by)