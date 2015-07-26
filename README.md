# Tidy-Data-Project

READme

==================================================================
Human Activity Recognition Using Smartphones Dataset
Coursera Getting an Cleaning Data Course Proyect
Data Science Specialization
Johns Hopkings University

==================================================================
Guerrero Gimenez Martin Eduardo
PhD Student of Molecular Biology
PROBIOL - National University of Cuyo
IMBECU-CCT-CONICET-MENDOZA
26 de Julio de 2015
Mendoza-Argentina
martinguerrero89@hotmail.com

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope.

In this analysis we are going to use the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


For more details on the experiment and the files available in the dataset please read the README.txt file in the main folder of the data. 


=========================================
#ANALYSIS

To run the analysis you should download the course data into your working directory and unzip it.
url= "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Pleas verify the folder has the original name "UCI HAR Dataset", otherwise the code won't work.


After Downloading the data run the "run_analysis.R" file in this repo
The code will perform the following steps.

##1 It will load a function that will be applied for the training and the test set separately.
The function will do the following:

-1.a Load the X, Y and Subjects archives of the set into the worksapce
-1.b Load the features file
-1.c Assign a new (and understandable) Column name for the Subjects, the Activity and the Features columns
-1.d Extract de mean() and the Std() measures for all the features
-1.e Combines the Subject, the Activity and the Features tables into one single data.frame
-1.f Gives the new dataframe a name according to the set that was used in the function (train or test)

The first 6 row of each individual data.frame can be loaded into the console typing
head(train)
head(test)

#2 The two dataframes will be merged into one

#3 Since the activity column has a reference number, each number is replaced with the corresponding activity name
using the activity_label file
head(XYTT)

#4 Creates the final Tidy dataset ussing the agreggate function to obtain the average measurment of each variable for each activity performed by every subject.
The outcome is a data.frame of 180 observations and 68 variables called TIDY.
head(TIDY)

 
Github repo for Getting and Cleaning Data Course of Coursera Data Science Specialization 
