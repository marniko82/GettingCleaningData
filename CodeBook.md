Code Book
=========

The data set was produced by running the run_analysis.R script. There are a total of 180 rows (30 Subjects  x 6 Activities, a single row for each Subject/Activity pair) and 68 columns, out of which 66 represent the calculated averages of various acceleration or gyro readings for each subject for each activity. 

Features:

Subject – unique test subject ID, a factor with values 1 to 30

Activity – a factor with one of 6 possible values - "Walking", "Walking_upstairs", "Walking_downstairs", "Sitting", "Standing", "Laying"

Variables representing the average of the mean, calculated per Subject/Activity combination (each of the six activities for each subject), 33 in total, are identified by the descriptor “mean”. Out of these 33 features, 20 are time domain features  and 13 are frequency domain features (identified by “Frequency” in the name). All features are normalized and bounded within [-1,1] with no measure. 

Variables representing the average of the standard deviation, calculated per Subject/Activity combination (each of the six activities for each subject), 33 in total,  are identified by the descriptor “std”. Out of these 33 features, 20 are time domain features  and 13 are frequency domain features (identified by “Frequency” in the name). All features are normalized and bounded within [-1,1] with no measure. 

Please refer to README.md for a complete description of the process of obtaining the data set, including transformations performed.

