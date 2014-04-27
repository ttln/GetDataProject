url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest.file <- "./data.zip"

if (!file.exists(dest.file)) {
  download.file(url, destfile=dest.file)
}

unzip(zipfile = dest.file)
