GettingCleaningData
===================

Repository for the Getting and Cleaning Data course

The study
=========

The study we analyzed concerns a study of human activity recognition using measurements made by smartphones. A total of 30 volunteers have participated in the study, wearing smartphones with embedded inertial sensors. Activities were filmed and then labeled manually. Readings were then split randomly into 70% training and 30% test set.
More details can be found on the following web-site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Raw data
Raw data was downloaded from the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
Raw data is provided in a zip file that contains the train and test folders, along with the explanatory text files. README.txt explains all the files provided. Activity labels are the labels of the activity that were manually entered (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING). Features.txt provides a list of all feature names and features_info.txt provides a detailed explanation of all features.
Information from features_info.txt is presented below:

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

There are a total of 561 features in the data set.

Data processing
===============

I focused on the six text files in train and test folders, ignoring the Inertial_signals folders.
subject_test.txt and subject_train.txt contain the labels of the participant. Each of the 30 participants was assigned a unique ID from 1 to 30.

 X_test.txt and X_train.txt contain the readings for 561 features.  Features are normalized and bounded within [-1,1]. Each feature vector is a row in the text file.
y_test.txt and y_train.txt contain the manually entered  values (1 to 6) corresponding to the previously described activity of the test subject.

The steps I followed in order to obtain a tidy data set as per project assignment:

I used R version 3.1.0 with reshape2 and plyr packages. 

I downloaded the data and unzipped it manually, using default folder names and structure.

Features were read in using read.table() function. Second column V2 contained the 561 feature names. I concatenated labels “Subject”, “Activity” and the feature names into a list.

Subject, activity and measurements for the train data were each loaded into a data frame using read.table() and then combined into a train data frame using cbind(subject, activity, measurements). Finally, column names were assigned to previously created features list using colnames().

The same process was used for the test data.

Train and test data frames were combined into all_data using rbind().

As per assignment, we were tasked with removing all the readings that were not a mean or a standard deviation. Upon inspecting the features list, I decided to keep the features whose names ended with either mean or std. I created a temporary list consisting of “Subject”, “Activity” and a list of all the names containing the exact words “mean()” or “std()”.  The filtering was performed by using the grep function: rep("mean\\(\\)", features, value=TRUE). The temporary list of names to keep was then used to subset all_data. 

As the activities were labeled with 1 to 6, I replaced them with their descriptive values and converted them into a factor. Subject was also converted into a factor.

Feature names were cleaned up using sub(). This part of the script was manual, please refer to the code for the exact implementation. Features which included the string “BodyBody” were assumed to be mistakenly named and were changed to a single “Body”. 

The final result are the following feature names: 
Subject
Activity
Body Acceleration mean X
Body Acceleration mean Y
Body Acceleration mean Z
Gravity Acceleration mean X
Gravity Acceleration mean Y
Gravity Acceleration mean Z
Body Acceleration Jerk mean X
Body Acceleration Jerk mean Y
Body Acceleration Jerk mean Z
Body Gyro mean X
Body Gyro mean Y
Body Gyro mean Z
Body Gyro Jerk mean X
Body Gyro Jerk mean Y
Body Gyro Jerk mean Z
Body Acceleration Magnitude mean
Gravity Acceleration Magnitude mean
Body Acceleration Jerk Magnitude mean
Body Gyro Magnitude mean
Body Gyro Jerk Magnitude mean
Body Acceleration Frequency mean X
Body Acceleration Frequency mean Y
Body Acceleration Frequency mean Z
Body Acceleration Jerk Frequency mean X
Body Acceleration Jerk Frequency mean Y
Body Acceleration Jerk Frequency mean Z
Body Gyro Frequency mean X
Body Gyro Frequency mean Y
Body Gyro Frequency mean Z
Body Acceleration Magnitude Frequency mean
Body Acceleration Jerk Magnitude Frequency mean
Body Gyro Magnitude Frequency mean
Body Gyro Jerk Magnitude Frequency mean
Body Acceleration std X
Body Acceleration std Y
Body Acceleration std Z
Gravity Acceleration std X
Gravity Acceleration std Y
Gravity Acceleration std Z
Body Acceleration Jerk std X
Body Acceleration Jerk std Y
Body Acceleration Jerk std Z
Body Gyro std X
Body Gyro std Y
Body Gyro std Z
Body Gyro Jerk std X
Body Gyro Jerk std Y
Body Gyro Jerk std Z
Body Acceleration Magnitude std
Gravity Acceleration Magnitude std
Body Acceleration Jerk Magnitude std
Body Gyro Magnitude std
Body Gyro Jerk Magnitude std
Body Acceleration Frequency std X
Body Acceleration Frequency std Y
Body Acceleration Frequency std Z
Body Acceleration Jerk Frequency std X
Body Acceleration Jerk Frequency std Y
Body Acceleration Jerk Frequency std Z
Body Gyro Frequency std X
Body Gyro Frequency std Y
Body Gyro Frequency std Z
Body Acceleration Magnitude Frequency std
Body Acceleration Jerk Magnitude Frequency std
Body Gyro Magnitude Frequency std
Body Gyro Jerk Magnitude Frequency std

The new all_data frame was then used to make a tidy data set with average values for each feature per activity and per test subject. all_data was melted using melt() with parameters id=c("Subject", "Activity") and measure.vars = all other columns of the data frame. 

The melted table was then cast using dcast(melted,  Subject + Activity ~ variable,mean).

Finally, the result was saved as a .txt using write.table() with row.names=FALSE parameter.
