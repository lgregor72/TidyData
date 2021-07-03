# CODE BOOK
The run_analysis.R script performs data preparation according to the course project definition followed by creation of the final tidy data set which contains the average of each variable for each subject and activity.

## 1. Download the data
Downloaded and unzipped the data into folder named UCI HAR Dataset 

## 2. Read in all data files
features.txt (561 rows, 2 columns)
- *The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ*
- *The features file is used to assign column names to the X_test and X_train data
activity_labels.txt (6 rows, 2 columns)
- *List of activities performed when the corresponding measurements were taken*
subject_test.txt (2947 rows, 1 column)
- *Each row identifies the subject who performed the activity*
X_test.txt (2947 rows, 561 columns)
- *contains recorded features test data*
y_test.txt (2947 rows, 1 column)
- *contains activity code for test data - cross reference to activity_labels.txt*
subject_train.txt (7352 rows, 1 column)
- *Each row identifies the subject who performed the activity*
X_train.txt (7352 rows, 561 columns)
- *contains recorded features train data*
y_train.txt (7352 rows, 1 column)
- *contains activity code for train data - cross reference to activity_labels.txt*

## 3. Merge train and test datasets into one, keeping only the subject, activity and feature variables containing mean or standard deviation measures
- Combined subject_train and subject_test data together using rbind to create new dataset named subjects (10299 rows, 1 column) 
- Combined y_train and y_test data together using rbind then joined with activity_labels by activityid to create new dataset named activities (10299 rows, 2 columns)
- Combined x_train and x_test data together using rbind to create new dataset name results (10299 rows, 561 columns)
- Merged subject, activities and results to create new dataset named merged_df then filtered to column names containing "mean" or "std" (10299 rows, 88 columns)

## 4. Appropriately label the dataset with descriptive variable names
Performed the following on column names:
- Replaced ^t with Time
- Replaced ^f with Frequency
- Replaced Acc with Accelerometer
- Replaced Gyro with Gyroscope
- Replaced Mag with Magnitude
- Replaced BodyBody with Body
- Replaced all dots with an underscore
- Removed all trailing underscores

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Created final data set named average_df (180 rows, 88 columns) by grouping the data by subject and activity then calculating the mean for each remaining variable using the function summarise_all(mean).
Lastly, exported a pipe delimited text file named tidydata.txt.
