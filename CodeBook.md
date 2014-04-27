Code Book
=========

Data sources
------------
  * http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Publication: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
  
  Original details are in 'README.txt' and 'features_info.txt'.

Variables
---------

**Selected Variables**

The mean value and standard deviation were selected.

**Special Variables**

  * activity.id : The activity identifier;
  * activity.name : The name of the activity;
  * subject.id : Identifier of the subject.

**Data Variables**

*X*, *Y*, *Z* denotes the 3-axial signals.

*f* is the first character for frequency domain signals.
All other patterns start with *t*.

*Acc* stands for *acceleration*.

*Jerk* is for Jerk signals.

**Example:**

*tBodyAcc.mean.Z*: Body means acceleration for *Z*.

The bounds are [-1, 1].

Columns
------
* activity.name
* subject.id
* activity.id
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z

Transformations
---------------
* On the training and test sets:
  * Replace '()' and '-' in columns names by '.';
  * Select each column name with 'std()' or 'mean()' (now 'std.' and 'mean.');
  * Add the subject and activity id columns;
* Merge the training set and the test set by row;
* Merge again with the activity labels on the activity id;
The result is 'tidy.txt'

* Calculate the average of each variable by activity and subject.
The result is 'tidy_mean.txt'