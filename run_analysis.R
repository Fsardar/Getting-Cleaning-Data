#1- You should create one R script called run_analysis.R that does the following. 
#2- Merges the training and the test sets to create one data set.
#3- Extracts only the measurements on the mean and standard deviation for each measurement. 
#4- Uses descriptive activity names to name the activities in the data set
#5- Appropriately labels the data set with descriptive variable names. 
#6- From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

library(tables)
library(dplyr)
library(reshape2)

setwd("C:\\Dropbox\\DataScience\\03-Data\\Project")
#setwd("C:\\Users\\Faisal\\Dropbox\\DataScience\\03-Data\\Project")

#1 Merging the training & test data sets into ONE data set
train_subject <-read.table("data//train//subject_train.txt")
train_x <-read.table("data//train//X_train.txt")
train_y <-read.table("data//train//Y_train.txt")
test_subject <-read.table("data//test//subject_test.txt")
test_x <-read.table("data//test//X_test.txt")
test_y <-read.table("data//test//Y_test.txt")
features <- read.table("data//features.txt")

features_colname<-features$V2
colnames(train_x)<-features_colname
colnames(train_y)<-"Activity"
colnames(train_subject)<-"Subject"
full_train <- cbind(train_subject,train_y,train_x)

colnames(test_x)<-features_colname
colnames(test_y)<-"Activity"
colnames(test_subject)<-"Subject"
full_test <- cbind(test_subject,test_y,test_x)

complete_data<-rbind(full_train,full_test)

#2 Extract only the mesaurements on the mean & standard Deviation for each measurement
mean_std <- complete_data[, grep("mean|std|Subject|Activity", names(complete_data))]

#3 Uses descriptive activity names to name the activities in the data set
activity_lables <-read.table("data//activity_labels.txt")
activities <- as.character(activity_lables$V2)

#4- Appropriately labels the data set with descriptive variable names. 
data_w_labels <- complete_data
data_w_labels$Activity <- activities[complete_data$Activity]

#5- From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.
reshape_melt = melt(data_w_labels, id.var = c("Subject","Activity"))
avg = dcast(reshape_melt, Subject + Activity ~ variable, mean)

write.table(avg, file="upload.txt", row.name=FALSE, sep = ",")
