## GetCollectAssignment

An assignment for the Johns Hopkins Data Science online course module: Getting and Cleaning Data 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Instructions
============
The script to run is called run_analysis.R.  There is an RStudio project called GetCollectAssignment.Rproj that will set corrrect working directories. All data from the zip file needs to be loaded into the directory alongside the R script.

No parameters are needed to run the script.


* How the script works

1. get column names for the main data set by reading the features.txt file
2. make the column names a little more user friendly by using substitutions, taking out the punctuations used and camel casing the columns we will be using.
3. create a vector of the changed column names
4. get data from the training and test data sets, combine them and attach the friendly column names.
5. get and combine the activity type ids for the test and training data set
6. add activity ids column to main data frame, now we have a complete combined set of test and training data
7. make a lookup table from activity_labels
8. join the main data and the activity lookup data frames, now all row data should be complete; each row has an activity name and the 561 data points
9. create a vector of just the column names that we are interested in: e.g. any means or stds measurements
10. use this vector to extract the subset of columns for std and means measurements with the activity names
11. set up empty data frame for results output
12. split data on activity label names
13. for each activity type calculate the mean of each measure that we have selected.    
14.  create a result data frame with a row for each activity type and the means of the selected measures.
15. write the results out to file

