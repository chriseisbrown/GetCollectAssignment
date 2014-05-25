# get column names for main data set
col_name_data <- read.table("UCI HAR Dataset/features.txt", header=FALSE, col.names=c("col_id", "col_name"))

# make the column names a little more user friendly
col_name_data$new_col_name <- apply(col_name_data, 1, function(x) {  gsub("[[:punct:]]", "", x["col_name"]) } )
col_name_data$new_col_name <- apply(col_name_data, 1, function(x) {  result <- gsub("mean", "Mean", x["new_col_name"]) } )
col_name_data$new_col_name <- apply(col_name_data, 1, function(x) {  result <- gsub("std", "Std", x["new_col_name"]) } )


# get a vector of the column names
col_names <- col_name_data[["new_col_name"]]    

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

# create a vector of column names that we are interested in: e.g. any means or stds measurements
cols <- colnames(training_data_and_activity_name)

column_std <-  grep("Std[XYZ]", cols, perl=TRUE, value=TRUE)
column_mean <-  grep("Mean[XYZ]", cols, perl=TRUE, value=TRUE)

# so we want just the columns for std and means measurements with the activity names
column_std_and_mean <- c("activity_name", column_std, column_mean)

# get a subset of the data with these columns
training_data_and_activity_name_std_mean <- training_data_and_activity_name[, column_std_and_mean]

# split data on activity labels
number_of_columns <- 49
result_frame <- data.frame(t(rep(NA,number_of_columns)), stringsAsFactors = FALSE)
names(result_frame) <- colnames(training_data_and_activity_name_std_mean)
result_frame <- result_frame[-1,]

split_training_data_and_activity_name_std_mean <- split(training_data_and_activity_name_std_mean, activity_labels$activity_name, drop = TRUE)
for(s in split_training_data_and_activity_name_std_mean){
    
    # 
    s_numeric <- s[, 2:49]
    s_numeric <- data.frame(lapply(s_numeric, as.numeric), stringsAsFactors=FALSE)
    s_numeric <- apply(s_numeric, 2, mean)
    
    #sdf <- data.frame(lapply(s, as.character), stringsAsFactors=FALSE)
    #result_activity_label <- sdf[1,1]
    result_activity_label <- as.character(s[1,1])
    
    result_row <- c(activity_name=result_activity_label, s_numeric)
    r <- data.frame(as.list(result_row))
    result_frame <- rbind(result_frame, r)
}

