# CODEBOOK

The R script run_analysis.R accomplishes the following steps to create a tidy dataset. 
* Reads the following txt files from the UCI HAR Dataset
	- X_train, X_test
	- y_train, y_test
	- subject_train, subject_test
	- activity_labels
	- features

* Merges the training and the test sets to create one data set.
	- Merge X_train and X_test using the rbind() function. {Variable : X.merged}
	- In the sameway, merge y_train and y_test using the rbind() function. {Variable : y.merged}
	- Also, merge subject_train and subject_test using the rbind function. {Variable : subject.merged}

* Extracts only the measurements on the mean and standard deviation for each measurement. 
	- Using the filter() function (from the dplyr package in R}, filter out the variables with mean and std in their names. This filtering produces 66 variables that we need to consider.  {Variable : features.mean.std}
	- From the merged X dataset, using the select() function (from the dplyr package), select the columns that match the above filtered column positions/indices. {Variable : X.merged.mean.std}

* Uses descriptive activity names to name the activities in the data set
	- Assign activity names in the activity labels to the merged y dataset.

* Appropriately labels the data set with descriptive variable names. 
	- Now assign the variables names using the names() function to the merged datasets of X, y and subject 
	- Since the computation is the average of each variable for each activity and each subject, a prefix called "Avg" has been attached to each variable name of the merged dataset of X.

* From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	- Bind the merged datasets of X, subject and y together using the cbind() function. (Variable : final.df)
	- To the resulting dataframe, apply the group_by() function of the dplyr package to group the dataframe by Activity and Subject
	- Using the summarise_each function() of the dplyr package, calculate the average for each column variable. {Variable : tidy.dataset}
	- The final tidy dataset is output to file named "tidy_dataset.txt". 


Variables in the tidy dataset that is created by the run_analysis.R script:

Activity 
Subject 
Avg-tBodyAcc-mean()-X 
Avg-tBodyAcc-mean()-Y 
Avg-tBodyAcc-mean()-Z 
Avg-tBodyAcc-std()-X 
Avg-tBodyAcc-std()-Y 
Avg-tBodyAcc-std()-Z 
Avg-tGravityAcc-mean()-X 
Avg-tGravityAcc-mean()-Y 
Avg-tGravityAcc-mean()-Z 
Avg-tGravityAcc-std()-X 
Avg-tGravityAcc-std()-Y 
Avg-tGravityAcc-std()-Z 
Avg-tBodyAccJerk-mean()-X 
Avg-tBodyAccJerk-mean()-Y 
Avg-tBodyAccJerk-mean()-Z 
Avg-tBodyAccJerk-std()-X 
Avg-tBodyAccJerk-std()-Y 
Avg-tBodyAccJerk-std()-Z 
Avg-tBodyGyro-mean()-X 
Avg-tBodyGyro-mean()-Y 
Avg-tBodyGyro-mean()-Z 
Avg-tBodyGyro-std()-X 
Avg-tBodyGyro-std()-Y 
Avg-tBodyGyro-std()-Z 
Avg-tBodyGyroJerk-mean()-X 
Avg-tBodyGyroJerk-mean()-Y 
Avg-tBodyGyroJerk-mean()-Z 
Avg-tBodyGyroJerk-std()-X 
Avg-tBodyGyroJerk-std()-Y 
Avg-tBodyGyroJerk-std()-Z 
Avg-tBodyAccMag-mean() 
Avg-tBodyAccMag-std() 
Avg-tGravityAccMag-mean() 
Avg-tGravityAccMag-std() 
Avg-tBodyAccJerkMag-mean() 
Avg-tBodyAccJerkMag-std() 
Avg-tBodyGyroMag-mean() 
Avg-tBodyGyroMag-std() 
Avg-tBodyGyroJerkMag-mean() 
Avg-tBodyGyroJerkMag-std() 
Avg-fBodyAcc-mean()-X 
Avg-fBodyAcc-mean()-Y 
Avg-fBodyAcc-mean()-Z 
Avg-fBodyAcc-std()-X 
Avg-fBodyAcc-std()-Y 
Avg-fBodyAcc-std()-Z 
Avg-fBodyAccJerk-mean()-X 
Avg-fBodyAccJerk-mean()-Y 
Avg-fBodyAccJerk-mean()-Z 
Avg-fBodyAccJerk-std()-X 
Avg-fBodyAccJerk-std()-Y 
Avg-fBodyAccJerk-std()-Z 
Avg-fBodyGyro-mean()-X 
Avg-fBodyGyro-mean()-Y 
Avg-fBodyGyro-mean()-Z 
Avg-fBodyGyro-std()-X 
Avg-fBodyGyro-std()-Y 
Avg-fBodyGyro-std()-Z 
Avg-fBodyAccMag-mean() 
Avg-fBodyAccMag-std() 
Avg-fBodyBodyAccJerkMag-mean() 
Avg-fBodyBodyAccJerkMag-std() 
Avg-fBodyBodyGyroMag-mean() 
Avg-fBodyBodyGyroMag-std() 
Avg-fBodyBodyGyroJerkMag-mean() 
Avg-fBodyBodyGyroJerkMag-std()
