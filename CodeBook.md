Code Book
=========

The data set was produced by running the run_analysis.R script. There are a total of 180 rows (30 Subjects  x 6 Activities, a single row for each Subject/Activity pair) and 68 columns, out of which 66 represent the calculated averages of various acceleration or gyro readings for each subject for each activity. 

Features:

Subject – unique test subject ID, a factor with values 1 to 30

Activity – a factor with one of 6 possible values - "Walking", "Walking_upstairs", "Walking_downstairs", "Sitting", "Standing", "Laying"

Variables representing the average of the mean, calculated per Subject/Activity combination (each of the six activities for each subject), 33 in total, are identified by the descriptor “mean”. Out of these 33 features, 20 are time domain features  and 13 are frequency domain features (identified by “Frequency” in the name). All features are normalized and bounded within [-1,1] with no measure. 

Variables representing the average of the standard deviation, calculated per Subject/Activity combination (each of the six activities for each subject), 33 in total,  are identified by the descriptor “std”. Out of these 33 features, 20 are time domain features  and 13 are frequency domain features (identified by “Frequency” in the name). All features are normalized and bounded within [-1,1] with no measure. 

[b]Please refer to README.md for a complete description of the process of obtaining the data set, including transformations performed.[/b]


Complete list of features:

Subject, Activity, Body Acceleration mean X, Body Acceleration mean Y, Body Acceleration mean Z, Gravity Acceleration mean X, Gravity Acceleration mean Y, Gravity Acceleration mean Z, Body Acceleration Jerk mean X, Body Acceleration Jerk mean Y, Body Acceleration Jerk mean Z, Body Gyro mean X, Body Gyro mean Y, Body Gyro mean Z, Body Gyro Jerk mean X, Body Gyro Jerk mean Y, Body Gyro Jerk mean Z, Body Acceleration Magnitude mean, Gravity Acceleration Magnitude mean, Body Acceleration Jerk Magnitude mean, Body Gyro Magnitude mean, Body Gyro Jerk Magnitude mean, Body Acceleration Frequency mean X, Body Acceleration Frequency mean Y, Body Acceleration Frequency mean Z, Body Acceleration Jerk Frequency mean X, Body Acceleration Jerk Frequency mean Y, Body Acceleration Jerk Frequency mean Z, Body Gyro Frequency mean X, Body Gyro Frequency mean Y, Body Gyro Frequency mean Z, Body Acceleration Magnitude Frequency mean, Body Acceleration Jerk Magnitude Frequency mean, Body Gyro Magnitude Frequency mean, Body Gyro Jerk Magnitude Frequency mean, Body Acceleration std X, Body Acceleration std Y, Body Acceleration std Z, Gravity Acceleration std X, Gravity Acceleration std Y, Gravity Acceleration std Z, Body Acceleration Jerk std X, Body Acceleration Jerk std Y, Body Acceleration Jerk std Z, Body Gyro std X, Body Gyro std Y, Body Gyro std Z, Body Gyro Jerk std X, Body Gyro Jerk std Y, Body Gyro Jerk std Z, Body Acceleration Magnitude std, Gravity Acceleration Magnitude std, Body Acceleration Jerk Magnitude std, Body Gyro Magnitude std, Body Gyro Jerk Magnitude std, Body Acceleration Frequency std X, Body Acceleration Frequency std Y, Body Acceleration Frequency std Z, Body Acceleration Jerk Frequency std X, Body Acceleration Jerk Frequency std Y, Body Acceleration Jerk Frequency std Z, Body Gyro Frequency std X, Body Gyro Frequency std Y, Body Gyro Frequency std Z, Body Acceleration Magnitude Frequency std, Body Acceleration Jerk Magnitude Frequency std, Body Gyro Magnitude Frequency std, Body Gyro Jerk Magnitude Frequency std
