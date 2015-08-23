This README.md describes how the script run_analysis.R works.

Project instructions (partial):

"Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."


Description of the script run_analysis.R, broken down by project instruction stages:

      "1. Merges the training and the test sets to create one data set."

1.1. Reads in the data tables using read.table (read in files: "X_train.txt"; "X_test.txt"; "y_train.txt"; "y_test.txt"; "subject_train.txt"; "subject_test.txt"; "features.txt" (specifies colClasses = c("character")); "activity_labels.txt" (specifies col.names = c("ActivityId", "Activity"))

1.2. Combines data tables by row bind & column bind: cbind training data sets; cbind test data sets; rbind training data by test data - results in data frame "all_data"

1.3. Applies labels to columns of "all_data" from "features" data set using rbind()

      "2. Extracts only the measurements on the mean and standard deviation for each measurement."

2.1. Extracts mean and SD values using grepl() (search for matches to a character vector) - searches col names for 'mean' 'std' 'Subject' & 'ActivityId'. Uses this to subset "all_data", resulting in data frame "all_data_mean_sd".

      "3. Uses descriptive activity names to name the activities in the data set"

3.1. Uses join() to merge "all_data_mean_sd" with "activity labels", by 'ActivityID', the column extracted from dataset in previous step - here serves as character vector of variable names to match by.

      "4. Appropriately labels the data set with descriptive variable names."

4.1. Takes out brackets using gsub() (find & replace), & adds readable names using make.names() (makes syntactically valid names out of character vectors) and gsub() - uses gsub() to replace several names with human-readable names.

      "5. From the data set in step 4, creates a second, independent tidy data set with the 
      average of each variable for each activity and each subject."

5.1 Creates tidy dataset using ddply to split data frame "all_data_mean_sd" by variables "subject" & "activity", & apply the mean function column-wise, using numcolwise(). Results in data frame "all_data_tidy"

5.2 Writes "all_data_tidy.txt" file using write.table(), specifying row.name=FALSE, as instructed.
