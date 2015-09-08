## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
each activity and each subject.

##Study design and data processing

###Collection of the raw data
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL)
while carrying a waist-mounted smartphone with embedded inertial sensors.

###Notes on the original (raw) data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label
the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which 
has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.

##Creating the tidy datafile

###Guide to create the tidy data file
1. download the data from link above
2. unzip files within your working directory
3. run R script "run_analysis.R"
"all_data_tidy.txt" will now be saved to working directory

###Cleaning of the data
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
activity and each subject. [please see: https://github.com/Kat-Sprat/Peer_assessment/blob/master/README.md for further 
details]

##Description of the variables in the "all_data_tidy.txt" file
General description of the file including:
 - Dimensions of the dataset: 180 obs. of 68 variables
 - Summary of the data: contains the average (mean) and standard deviation of each variable for each activity and each 
 subject; please note, I judged the instructions "Extracts only the measurements on the mean and standard deviation..."
 not to include the mean frequency.
 - Variables present in the dataset: 
 [1] "Subject": integer - 1 to 30, indicating experiment participants 1 to 30.                                                    
 [2] "Activity": factor w/ 6 levels "Laying", "Sitting", "Standing", "Walking", "Walking_Downstairs", "Walking_Upstairs"                                                  
 All following variables are numeric values, that record the mean or standard deviation for variables described in the 
 features info: "features_info.txt": https://github.com/Kat-Sprat/Peer_assessment/blob/master/features_info
 [3] "TimeDomain.BodyAccelerometer.Mean.X"                       
 [4] "TimeDomain.BodyAccelerometer.Mean.Y"                       
 [5] "TimeDomain.BodyAccelerometer.Mean.Z"                       
 [6] "TimeDomain.BodyAccelerometer.Std_Dev.X"                    
 [7] "TimeDomain.BodyAccelerometer.Std_Dev.Y"                    
 [8] "TimeDomain.BodyAccelerometer.Std_Dev.Z"                    
 [9] "TimeDomain.GravityAccelerometer.Mean.X"                    
[10] "TimeDomain.GravityAccelerometer.Mean.Y"                    
[11] "TimeDomain.GravityAccelerometer.Mean.Z"                    
[12] "TimeDomain.GravityAccelerometer.Std_Dev.X"                 
[13] "TimeDomain.GravityAccelerometer.Std_Dev.Y"                 
[14] "TimeDomain.GravityAccelerometer.Std_Dev.Z"                 
[15] "TimeDomain.BodyAccelerometerJerk.Mean.X"                   
[16] "TimeDomain.BodyAccelerometerJerk.Mean.Y"                   
[17] "TimeDomain.BodyAccelerometerJerk.Mean.Z"                   
[18] "TimeDomain.BodyAccelerometerJerk.Std_Dev.X"                
[19] "TimeDomain.BodyAccelerometerJerk.Std_Dev.Y"                
[20] "TimeDomain.BodyAccelerometerJerk.Std_Dev.Z"                
[21] "TimeDomain.BodyGyroscope.Mean.X"                           
[22] "TimeDomain.BodyGyroscope.Mean.Y"                           
[23] "TimeDomain.BodyGyroscope.Mean.Z"                           
[24] "TimeDomain.BodyGyroscope.Std_Dev.X"                        
[25] "TimeDomain.BodyGyroscope.Std_Dev.Y"                        
[26] "TimeDomain.BodyGyroscope.Std_Dev.Z"                        
[27] "TimeDomain.BodyGyroscopeJerk.Mean.X"                       
[28] "TimeDomain.BodyGyroscopeJerk.Mean.Y"                       
[29] "TimeDomain.BodyGyroscopeJerk.Mean.Z"                       
[30] "TimeDomain.BodyGyroscopeJerk.Std_Dev.X"                    
[31] "TimeDomain.BodyGyroscopeJerk.Std_Dev.Y"                    
[32] "TimeDomain.BodyGyroscopeJerk.Std_Dev.Z"                    
[33] "TimeDomain.BodyAccelerometerMagnitude.Mean"                
[34] "TimeDomain.BodyAccelerometerMagnitude.Std_Dev"             
[35] "TimeDomain.GravityAccelerometerMagnitude.Mean"             
[36] "TimeDomain.GravityAccelerometerMagnitude.Std_Dev"          
[37] "TimeDomain.BodyAccelerometerJerkMagnitude.Mean"            
[38] "TimeDomain.BodyAccelerometerJerkMagnitude.Std_Dev"         
[39] "TimeDomain.BodyGyroscopeMagnitude.Mean"                    
[40] "TimeDomain.BodyGyroscopeMagnitude.Std_Dev"                 
[41] "TimeDomain.BodyGyroscopeJerkMagnitude.Mean"                
[42] "TimeDomain.BodyGyroscopeJerkMagnitude.Std_Dev"             
[43] "FrequencyDomain.BodyAccelerometer.Mean.X"                  
[44] "FrequencyDomain.BodyAccelerometer.Mean.Y"                  
[45] "FrequencyDomain.BodyAccelerometer.Mean.Z"                  
[46] "FrequencyDomain.BodyAccelerometer.Std_Dev.X"               
[47] "FrequencyDomain.BodyAccelerometer.Std_Dev.Y"               
[48] "FrequencyDomain.BodyAccelerometer.Std_Dev.Z"               
[49] "FrequencyDomain.BodyAccelerometerJerk.Mean.X"              
[50] "FrequencyDomain.BodyAccelerometerJerk.Mean.Y"              
[51] "FrequencyDomain.BodyAccelerometerJerk.Mean.Z"              
[52] "FrequencyDomain.BodyAccelerometerJerk.Std_Dev.X"           
[53] "FrequencyDomain.BodyAccelerometerJerk.Std_Dev.Y"           
[54] "FrequencyDomain.BodyAccelerometerJerk.Std_Dev.Z"           
[55] "FrequencyDomain.BodyGyroscope.Mean.X"                      
[56] "FrequencyDomain.BodyGyroscope.Mean.Y"                      
[57] "FrequencyDomain.BodyGyroscope.Mean.Z"                      
[58] "FrequencyDomain.BodyGyroscope.Std_Dev.X"                   
[59] "FrequencyDomain.BodyGyroscope.Std_Dev.Y"                   
[60] "FrequencyDomain.BodyGyroscope.Std_Dev.Z"                   
[61] "FrequencyDomain.BodyAccelerometerMagnitude.Mean"           
[62] "FrequencyDomain.BodyAccelerometerMagnitude.Std_Dev"        
[63] "FrequencyDomain.BodyBodyAccelerometerJerkMagnitude.Mean"   
[64] "FrequencyDomain.BodyBodyAccelerometerJerkMagnitude.Std_Dev"
[65] "FrequencyDomain.BodyBodyGyroscopeMagnitude.Mean"           
[66] "FrequencyDomain.BodyBodyGyroscopeMagnitude.Std_Dev"        
[67] "FrequencyDomain.BodyBodyGyroscopeJerkMagnitude.Mean"       
[68] "FrequencyDomain.BodyBodyGyroscopeJerkMagnitude.Std_Dev"

##Sources
Codebook format adapted from https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41, as suggested by the Getting and 
Cleaning Data course Community site: http://datasciencespecialization.github.io/getclean/ 
