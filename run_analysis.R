run_analysis <- function() {
    # Assumption that this script is in the same directory 
    # as the UCI HAR Dataset directory
    
    # import required libraries
    library(dplyr)
    
    # Read all necessary data files
    X.train <- read.table("UCI HAR Dataset/train/X_train.txt")
    y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
    
    X.test <- read.table("UCI HAR Dataset/test/X_test.txt")
    y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
    
    subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    features <- read.table("UCI HAR Dataset/features.txt")
    
    # --------------------------------------------------------------------------#
    
    # 1. Merges the training and the test sets to create one data set.
    #    Merge X.train and X.test data frames into a single data frame for X
    X.merged <- rbind(X.train, X.test) 
    
    #    Merge y.train and y.test data frames into a single data frame for y
    y.merged <- rbind(y.train, y.test)
    
    #    Merge subject.train and subject.test data frames into a single data frame for subject
    subject.merged <- rbind(subject.train, subject.test)

    # --------------------------------------------------------------------------#
    
    # 2. Extracts only the measurements on the mean and 
    #    standard deviation for each measurement. 
    
    # Filter features that correspond to mean and standard deviation measurements 
    features.mean.std <- filter(features, grepl("mean\\(\\)|std\\(\\)", 
                                                features$V2, 
                                                ignore.case = TRUE))
    
    # Based on the features selected in the previous step, select only
    # the columns in X.merged that match mean and standard deviation measurements
    X.merged.mean.std <- select(X.merged, features.mean.std$V1)
    
    # --------------------------------------------------------------------------#
    
    # 3. Uses descriptive activity names to name the activities in the data set
    y.merged[,1] <- activity.labels[y.merged[,1], 2]
    
    # --------------------------------------------------------------------------#
    
    # 4. Appropriately labels the data set with descriptive variable names. 
    prefix <- rep("Avg", length(features.mean.std$V2))
    names(X.merged.mean.std) <- paste(prefix, features.mean.std$V2, sep = "-")
    names(y.merged) <- "Activity"
    names(subject.merged) <- "Subject"
    
    # --------------------------------------------------------------------------#
    
    # 5. From the data set in step 4, create a second, 
    # independent tidy data set with the average of each variable for each activity 
    # and each subject.
    
    final.df <- cbind(X.merged.mean.std, subject.merged, y.merged)    
    tidy.dataset <- final.df %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
    write.table(tidy.dataset, "tidy_dataset.txt", row.names = FALSE, quote = FALSE )
    tidy.dataset
}