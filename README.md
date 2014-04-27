GetDataProject
==============

### Description ###

* 'get_data.R' downloads the data sets archive if 'data.zip' is not present.
'data.zip' is then unzipped.

* 'run_analysis.R' loads:
  * y_test.txt and x_test.txt (test data);
  * y_train.txt and x_train.txt (training data);
  * subject_test.txt;
  * subject_train.txt;
  * features.txt (columns names).
  
* '()' and '-' are then replaced by '.' for each column name;

* All columns with 'std.' or 'mean.' are selected;

* The test and training data sets are then subseted with the selected columns;

* The subject and activity ids are added to both data sets;

* The test and training data sets are merged and the activities are labelled;

* The resulting tidy data set is written to disk ('tidy.txt');

* An average of each variable for each subject and activity is computed and
written to disk ('tidy_mean.txt').

For 'run_analysis.R' to run, the 'sqldf' library must be installed