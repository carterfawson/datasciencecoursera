#Tidy Data
##Taking the data from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and creating easy-to-use tidy data

###Here are the columns and their descriptions for the submitted dataset

* Subjects: These are the people who were involved in the study, each of them has a unique id number
* Activities: These are the activities that the subjects were doing when each observation was recorded
* The rest of 'em: I don't know if anyone else knew what was going on with these datapoints, but I made sure to grab only the means, and the standard deviations for each of these observation columns. Also, in this particular tidy dataset these have been grouped first by Subject, then by Activity, and finally the mean was taken for each column in those groups.

###There are two datasets that I made for my own personal enjoyment and preference in case I ever needed to use these again. They are both csv files and I would like to explain the difference
* full_tidyData.csv: In this dataset each row represents an individual observation with all of the accelerometer data each in it's own column
* tidyData.csv: This dataset has grouped the above dataset first by Subjects, then by Activities, and gotten a mean for each of the variable columns


