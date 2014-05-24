# get column names for main data set
col_name_data <- read.table("UCI HAR Dataset/features.txt", header=FALSE, col.names=c("col_id", "col_name"))

# get a vector of the column names
col_names <- col_name_data[["col_name"]]    

# get data from training set with columnnames
training_data <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=col_names)

# get activity type ids from training set 
training_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names=c("activity_id"))

# add activity ids column to main data frame
training_data_and_activity <- data.frame(training_activities, training_data)

# make a lookup table from activity_labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("activity_id", "activity_name"))

# join the main data and the activity lookups, now all row data should be complete; each row has an activity name and the 561 data points
training_data_and_activity_name <- merge(activity_labels, training_data_and_activity,by="activity_id", all.x=TRUE)

# create a vector of column names that we are interested in: e.g. any means or stds
cols <- colnames(training_data_and_activity_name)
column_std <- column_finder(cols, "std\\.")
column_mean <- column_finder(cols, "mean\\.")
column_std_and_mean <- c(column_std, column_mean)

column_std_and_mean
head(training_data_and_activity_name[, column_std_and_mean)])
head(training_data_and_activity_name[, c("tBodyAcc.mean...X")])

head(training_data_and_activity_name[, c("activity_id")])

colnames(training_data_and_activity_name)
cols <- colnames(training_data_and_activity_name)
