# TidyData Repository
This repository contains my submission for the Week 4 Assignment for Coursera Getting and Cleaning Data. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data should be downloaded and unzipped into the R working directory. Next, download the R code into the working directory. Lastly, execute the R code to prepare the data and export the tinydata file. 

## Files in Repository
CodeBook.md - a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

run_analysis.R - performs the data preparation followed by the 5 steps required as described in the course project’s definition:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata.txt - a pipe delimited text file exported from the final dataset created in step 5 above.
