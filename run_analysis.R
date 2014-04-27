GetTidyData <- function() {
  
  library(sqldf)
  root.path <- "./Uci HAR Dataset"
  test.path <- "./Uci HAR Dataset/test"
  train.path <- "./Uci HAR Dataset/train"
  
  message("Loading and merging data, please wait.")
  # Read the data.
  columns <- read.table(paste(root.path, "features.txt", sep="/"),
                        header=FALSE,
                        col.names=c("id", "name"))
  
  columns$name <- gsub(pattern="*\\(\\)*", replacement="", x=columns$name)
  columns$name <- gsub(pattern="-", replacement=".", x=columns$name)
  
  y.test <- read.table(paste(test.path, "y_test.txt", sep="/"),
                       header=FALSE,
                       col.names=c("activity.id"))

  subject.test <- read.table(paste(test.path, "subject_test.txt", sep="/"),
                             header=FALSE,
                             col.names=c("subject.id"))
  
  x.test <- read.table(paste(test.path, "X_test.txt", sep="/"),
                       header=FALSE,
                       col.names=columns$name)
  
  y.train <- read.table(paste(train.path, "y_train.txt", sep="/"),
                        header=FALSE,
                        col.names=c("activity.id"))
  
  subject.train <- read.table(paste(train.path, "subject_train.txt", sep="/"),
                              header=FALSE,
                              col.names=c("subject.id"))
  
  x.train <- read.table(paste(train.path, "X_train.txt", sep="/"),
                        header=FALSE,
                        col.names=columns$name)
  
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  subset.columns <- as.vector(sqldf("SELECT col.name FROM columns AS col WHERE name LIKE '%mean.%' OR name LIKE '%std.%'")$name)
  x.test <- x.test[, subset.columns]
  x.train <- x.train[, subset.columns]
  
  # Append 'subject.id' and 'activity.id'
  x.test$subject.id <- subject.test$subject.id
  x.test$activity.id <- y.test$activity.id
  x.train$subject.id <- subject.train$subject.id
  x.train$activity.id <- y.train$activity.id
  
  
  # 1. Merges the training and the test sets to create one data set.
  df.raw <- rbind(x.test, x.train)
  
  
  # 3. Uses descriptive activity names to name the activities in the data set.
  # 4. Appropriately labels the data set with descriptive activity names. 
  activity.labels <- read.table(paste(root.path, "activity_labels.txt", sep="/"),
                                header=FALSE,
                                col.names=c("activity.id", "activity.name"))
  tidy <- merge(df.raw, activity.labels, by.x="activity.id", by.y="activity.id")
  
  write.table(tidy, "./tidy.txt")

  # 5. Creates a second, independent tidy data set with the average
  # of each variable for each activity and each subject
  tidy.mean <- aggregate( . ~ activity.name + subject.id, tidy, mean)
  
  write.table(tidy.mean, "./tidy_mean.txt")
  
}

GetTidyData()