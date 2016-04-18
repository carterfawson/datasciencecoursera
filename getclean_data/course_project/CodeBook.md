#Tidy Data
##Taking the data from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and creating easy-to-use tidy data

###In both datasets there are two columns I would like to highlight before I explain the process in which I got to the tidy data

* Subjects: These are the people who were involved in the study, each of them has a unique id number
* Activities: These are the activities that the subjects were doing when each observation was recorded

###Then there are two datasets and I would like to explain the difference
* full_tidyData.csv: In this dataset each row represents an individual observation with all of the accelerometer data each in it's own column
* tidyData.csv: This dataset has grouped the above dataset first by Subjects, then by Activities, and gotten a mean for each of the variable columns

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
