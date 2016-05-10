library(dplyr)
##read in the activities, features,
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merges the training and the test sets to create one data set.

newDataSet <- cbind2(rbind(x_test,x_train),rbind(y_test,y_train))
newDataSet <- cbind2(newDataSet,rbind(subject_test,subject_train,subject_test,subject_train))

## Extracts only the measurements on the mean and standard deviation for each measurement.

##Get all labels
labels <- features[,2]
activityInt <-as.character(activity_labels$V1)
activityName <- as.character(activity_labels$V2)

##Get positions labels that contain "mean" or "std"
neededCols <-grep("mean|std",labels)

##Subset cols that have "mean" or "std" in the name plus activity and subject cols
subsettedData <-newDataSet[c(neededCols,562,563)]

##Turn factors into char to be used as column names
unformattedColNames <- as.character(labels[neededCols])

##Format the labels
formattedColNames <- gsub('[-(),]+','',tolower(unformattedColNames))

##add labels for activity and subject
formattedColNames <- append(formattedColNames,c("activity","subject"))

##apply label names
colnames(subsettedData) <- formattedColNames 

##set columns as factors so it can be aggregated
subsettedData$activity <- as.factor(subsettedData$activity)
subsettedData$subject <- as.factor(subsettedData$subject)

##replace activity integer label with activity character label
subsettedData$activity <- plyr::mapvalues(subsettedData$activity,activityInt,tolower(activityName))

##aggregate the data
tidyData <- aggregate(. ~ subject+activity, data=subsettedData, FUN=mean)

##write the table
write.table(tidyData, "tidy.txt", sep="\t",row.names=FALSE)

