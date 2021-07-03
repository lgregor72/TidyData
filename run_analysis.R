library(dplyr)

setwd("C:/Users/linda/OneDrive/coursera/TidyData")

## Read in the data for labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names = c("activityid", "activity") )
feature_labels <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, col.names = c("fid", "metric"))

## Read in the train data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names = feature_labels$metric)
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, col.names = "activityid")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = "subjectid")

## Read in the test data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names = feature_labels$metric)
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, col.names = "activityid")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = "subjectid")

## Combine test and train data
subjects <- rbind(subtrain, subtest)
activities <- rbind(ytrain, ytest) %>%
  inner_join(activity_labels, by="activityid")
results <- rbind(xtrain, xtest)

## Merge data and subset to features with mean and std
merged_df <- cbind(subjects, activities, results) %>%
  select(subjectid, activity, contains("mean"), contains("std"))

## Provide descriptive labels for features
names(merged_df) <- gsub("^t", "Time", names(merged_df))
names(merged_df) <- gsub("^f", "Frequency", names(merged_df))
names(merged_df) <- gsub("Acc", "Accelerometer", names(merged_df))
names(merged_df) <- gsub("Gyro", "Gyroscope", names(merged_df))
names(merged_df) <- gsub("Mag", "Magnitude", names(merged_df))
names(merged_df) <- gsub("BodyBody", "Body", names(merged_df))
names(merged_df) <- gsub("\\.+", "_", names(merged_df))
names(merged_df) <- gsub("_$", "", names(merged_df))

## Calculate average of each variable for each activity and each subject
average_df <- merged_df %>%
  group_by(subjectid, activity) %>%
  summarise_all(mean)

## Export table to text file
write.table(average_df, "tidydata.txt", sep = "|", col.names = TRUE, quote = FALSE, row.names = FALSE)

