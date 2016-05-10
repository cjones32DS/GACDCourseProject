# Getting And Cleaning Data Course Project

##Final Course Project

For this assignment, we were to take a non-tidy data set and turn it into a tidy data set that could be used for later analysis.

The analysis script, run_analysis.R was written in RStudio running on Ubuntu 16.04. The original UCI-HAR dataset is available 
from: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

The analysis script reads the non-tidy dataset and, by a series of manipulations, turns the non-tidy data set into a tidy data set. There were several required characteristics for our analysis script including that it should:
 
 * Merge the training and the test sets to create one data set.
 * Extract only the measurements on the mean and standard deviation for each measurement.
 * Use descriptive activity names to name the activities in the data set
 * Appropriately label the data set with descriptive variable names.
 * From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
 
##Usage
 
 In order to use the run_analysis.R script, you must first download and unzip the UCI-HAR dataset into the working directory of your R installation. The script will not work if the "UCI HAR Dataset" directory does not exist. 
 
##Dependencies
 
 There is only one dependency for the run_analysis.R script:
 
  * dplyr package

