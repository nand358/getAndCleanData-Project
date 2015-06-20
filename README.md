# GetAndCleanData-Project

This github repo contains the run_analysis.R (R script) and CodeBook.md files for the Project of "Getting and Cleaning Data" Coursera course. The data for the project is available at the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description of files:

1. run_analysis.R

  This R script reads the required data files, performs a merge and clean up process on measurements of mean and standard deviation of variables, and creates a tidy dataset. The tidy dataset is written out to the same directory as a txt file with the name "tidy_dataset.txt". 
  
  The steps that were followed are as below:

  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * From the data set in previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.

2. CodeBook.md

  The CodeBook.md file provides a description of the dataset, variables and transformations that were performed to prepare the tidy dataset.

IMPORTANT ASSUMPTION: 
The R script (run_analysis.R) assumes that the dataset has been downloaded and unzipped into the directory where this script resides. Also the internal structure of the files in the "UCI HAR Dataset" must not be changed otherwise analysis script will fail to produce the expected tidy dataset.


