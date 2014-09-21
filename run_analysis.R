#download file, load libraries, unzip MANUALLY to working directory using default name
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="data.zip",method="internal") 
library(reshape2)
library(plyr)


#create feature labels
feat <- read.table("./UCI HAR Dataset/features.txt")
features <- c("Subject","Activity", as.character(factor(feat$V2)))

#create test, train and full data sets
#added columns for serial number and test/train set identification
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train <- cbind(train_s, train_y, train_x)
colnames(train) <- features

test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test <- cbind(test_s, test_y, test_x)
colnames(test) <- features

all_data <- rbind(train,test)

#from the complete data set, eliminate unnecessary columns
#preserve only ones with mean() or std() at the end

names_to_keep <- c("Subject","Activity",grep("mean\\(\\)", features, value=TRUE),grep("std\\(\\)", features, value=TRUE))
all_data <- all_data[,names_to_keep]

#change activity names to descriptive names and convert to factor
all_data$Activity[which(all_data$Activity==1)] <- "Walking"
all_data$Activity[which(all_data$Activity==2)] <- "Walking_upstairs"
all_data$Activity[which(all_data$Activity==3)] <- "Walking_downstairs"
all_data$Activity[which(all_data$Activity==4)] <- "Sitting"
all_data$Activity[which(all_data$Activity==5)] <- "Standing"
all_data$Activity[which(all_data$Activity==6)] <- "Laying"
all_data$Activity <- as.factor(all_data$Activity)
#convert subject to factor
all_data$Subject <- as.factor(all_data$Subject)


#Clean up names 
names(all_data) <- sub("\\()-"," ",names(all_data))
names(all_data) <- sub("\\()","",names(all_data))
names(all_data) <- sub(" ","",names(all_data))
names(all_data) <- sub("-mean*"," mean",names(all_data))
names(all_data) <- sub("-std*"," std",names(all_data))
names(all_data) <- sub("meanX","mean X",names(all_data))
names(all_data) <- sub("meanY","mean Y",names(all_data))
names(all_data) <- sub("meanZ","mean Z",names(all_data))
names(all_data) <- sub("stdX","std X",names(all_data))
names(all_data) <- sub("stdY","std Y",names(all_data))
names(all_data) <- sub("stdZ","std Z",names(all_data))

names(all_data) <- sub("tGravityAccMag","Gravity Acceleration Magnitude",names(all_data))
names(all_data) <- sub("tGravityAcc","Gravity Acceleration",names(all_data))

names(all_data) <- sub("tBodyAccJerkMag","Body Acceleration Jerk Magnitude",names(all_data))
names(all_data) <- sub("tBodyAccJerk","Body Acceleration Jerk",names(all_data))
names(all_data) <- sub("tBodyAccMag","Body Acceleration Magnitude",names(all_data))
names(all_data) <- sub("tBodyAcc","Body Acceleration",names(all_data))

names(all_data) <- sub("tBodyGyroJerkMag","Body Gyro Jerk Magnitude",names(all_data))
names(all_data) <- sub("tBodyGyroJerk","Body Gyro Jerk",names(all_data))
names(all_data) <- sub("tBodyGyroMag","Body Gyro Magnitude",names(all_data))
names(all_data) <- sub("tBodyGyro","Body Gyro",names(all_data))

names(all_data) <- sub("fBodyAccJerkMag","Body Acceleration Jerk Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyAccMag","Body Acceleration Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyAccJerk","Body Acceleration Jerk Frequency",names(all_data))
names(all_data) <- sub("fBodyAcc","Body Acceleration Frequency",names(all_data))


names(all_data) <- sub("fBodyGyroJerkMag","Body Gyro Jerk Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyGyroMag","Body Gyro Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyGyro","Body Gyro Frequency",names(all_data))

names(all_data) <- sub("fBodyBodyAccJerkMag","Body Acceleration Jerk Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyBodyGyroJerkMag","Body Gyro Jerk Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyBodyGyroMag","Body Gyro Magnitude Frequency",names(all_data))
names(all_data) <- sub("fBodyBodyGyroMag","Body Gyro Magnitude Frequency",names(all_data))

#make a new dataset
#melt the data set 
melted <- melt(all_data,id=c("Subject", "Activity"),measure.vars=as.character(names(all_data)[3:length(all_data)]))

#summarize by subject and activity, taking the mean 
castt <- dcast(melted,  Subject + Activity ~ variable,mean)

#export as txt file
write.table(castt, file ="final_result.txt", row.names=FALSE)
