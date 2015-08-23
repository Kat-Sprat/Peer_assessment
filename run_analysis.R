if (!require("plyr")) {
        install.packages("plyr")
}
require("plyr")
#You should create one R script called run_analysis.R that does the following:
#1. Merges the training and the test sets to create one data set.

# read in the data tables 
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") 
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt", 
                       colClasses = c("character"))

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("ActivityId", "Activity"))

# combine data tables by row bind & column bind
training_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
all_data <- rbind(training_data, test_data)

# apply labels to columns
labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(all_data) <- labels

#2. Extracts only the measurements on the mean and standard deviation for each 
#measurement.
# extract mean and SD values using grepl (search for matches to a character vector)
all_data_mean_sd <- all_data[,grepl("mean|std|Subject|ActivityId", names(all_data))]

#3. Uses descriptive activity names to name the activities in the data set
all_data_mean_sd <- join(all_data_mean_sd, activity_labels, by = "ActivityId", 
                         match = "first")
all_data_mean_sd <- all_data_mean_sd[,-1]

#4. Appropriately labels the data set with descriptive variable names.
# take out brackets using gsub (find & replace)
names(all_data_mean_sd) <- gsub('\\(|\\)',"",names(all_data_mean_sd), perl = TRUE)

# add readable names, using make.names (makes syntactically valid names out of 
#character vectors) and gsub (find & replace)
names(all_data_mean_sd) <- make.names(names(all_data_mean_sd))

names(all_data_mean_sd) <- gsub('Acc',"Acceleration",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('GyroJerk',"AngularAcceleration",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('Gyro',"AngularSpeed",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('Mag',"Magnitude",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('^t',"TimeDomain.",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('^f',"FrequencyDomain.",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('\\.mean',".Mean",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('\\.std',".StandardDeviation",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('Freq\\.',"Frequency.",names(all_data_mean_sd))
names(all_data_mean_sd) <- gsub('Freq$',"Frequency",names(all_data_mean_sd))

#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
# create tidy dataset
all_data_tidy = ddply(all_data_mean_sd, c("Subject","Activity"), numcolwise(mean))
# write file
write.table(all_data_tidy, file = "all_data_tidy.txt", row.name=FALSE)
