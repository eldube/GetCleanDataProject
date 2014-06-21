# CodeBook for a Consolidated Human Activity Recognition Using Smartphones Dataset Version 1.0 Dataset

## Purpose

The purpose of the project was to consolidate the Human Activity Recognition Using Smartphones Dataset Version 1.0, which is stored in several
files and folders, into a single tidy dataset. Described below is the original data and the steps taken to consolidate the dataset into a single dataset. For each variable in the consolidated dataset, a brief description in given.

## The Original Data

The original data is the Human Activity Recognition Using Smartphones Dataset Version 1.0 available from 
www.smartlab.ws and described by Anguita D. et. al in the following official reference publication:

*Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.*
**Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.**
International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012 

According to the documentation, experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (**WALKING, WALKING-UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**) wearing a smartphone (Samsung Galaxy S II) on the waist. Details of how the data was collected and recorded can be obtained from the documentations at this URL : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Downloading the Original Dataset

A compressed data file can be downloaded from the following URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. When this file is unzipped several files are extracted into a folder called **UCI HAR Dataset**.  This folder contains two subfolders which randomly divides the dataset into training data (70% of the dataset stored in subfolder called **train** ) and test data (30% of the dataset stored in subfolder called **test**).Furthers details on the contents of the three folders  can be obtained from the documentation (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). In the sections that follow, we will simple refer to these three folders, and the specific files used in this project.

### Contents of folder UCI HAR Dataset
This folder contains information common to both the training data and test data in the data set.

- **README.txt** : a overall description of the experiment
- **features_info.txt**: Shows information about the variables used on the feature vector.
- **features.txt**: List of all features.
- **activity_labels.txt**: Links the class labels with their activity name.

### Contents of subfolder train 
This folder contains information on the training data  which constitute 70% of the dataset.
- **train/X_train.txt**: Training set data 
- **train/y_train.txt**: Training labels.
- **train/subject_train.txt**: Each row identifies the subject/volunteer who performed the activity. Its range is from 1 to 30. 


### contents of subfolder train 
his folder contains information on the test data  which constitute 30% of the dataset.
- **test/X_test.txt**: Test set.
- **test/y_test.txt**: Test labels.
- **test/subject_train.txt**: Each row identifies the subject/volunteer who performed the activity. Its range is from 1 to 30.

The purpose of this project was to consolidate the information contained in these files and folders into a single dataset that could be 
easier to use for further analysis. The section that follows outlines the steps taken to generate the consolidated dataset.


## Transformation and Consolidating the Data


Firstly, a  compressed file of the original dataset was downloaded from the provided URL : "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" . , and uncompressed into a local working directory. The R code used to download the file, and perform
the  other steps explained below, can be viewed from the R script file : **run_analysis.R**) 

Secondly, the general data available in the folder called **UCI HAR Dataset** was extracted and processed using R as followed.  

1. Write R commands to read the feature variable names from **features.txt** file from the UCI HAR Dataset folder.These names are the same for both training and test data

2. Write R commands to reading activity label names from **activity_labels**.txt file. These labels are the same for both training and test data


Thirdly, each set of data( training and test) were, initially, processed separately and merged later as follows:

### Reading and processing the training data

The training data is stored in three text files (**X_train.txt, y_train.txt, subject_train.txt**) which are all found in the **./UCI HAR Dataset/train** folder. The following steps were performed.

3. Write R commands to read the coded training data labels from the file **y_train.txt** 
4. Write R commands to transform the coded labels to matching descriptive activity names as tabulated in the the file **activity_labels.txt** and read in previous step above.
5. Write R commands to read the training data subject/volunteer details from the file **subject_train.txt** 

6. Write R commands to read the test data from the file **X_train.txt**
7. Write R commands to add descriptive column names to the training data using information from the **features.txt** file that was read in sa previous step above.
8. Write R commands to extract only the measurements on mean and standard deviation for each measurent in the training data set 

### Reading and processing the test data

Similarly, the test data is stored in three text files (**X_test.txt, y_test.txt, subject_test.txt**) which all are all stored in the **./UCI HAR Dataset/test** folder. The following steps were performed.

8. Write R commands to read the coded test data labels from the file **y_test.txt**
9. Write R commands to transform coded labels to matching descriptive activity names as tabulated in the the file 
 **activity_labels.txt** and read in a previous step above.
10. Write R commands to read test data subject/volunteer details from **subject_test.txt** file

11. Write R commands to read the test data from the **X_test.txt** file
12. Write R commands to add descriptive column names to the test data using information from the file**features.txt** that was read in
a previous step above.
13. Write R commands to extract only the measurements on mean and standard deviation for each measurent in the test data set

14. Merge the training and test data obtained togethert to from one dataset.
15. Make the column names more readable by changing renaming and removing unnecessary symbols.
16. Save the merged dataset to a file, called **WearableData.RData** , that can be loaded into an R session later using the **load()**
command.
17. Create a separate dataset that contains only the average of each variable in the **WearableData.RData** dataset for each activity and each 
subject/volunteer. Save this dataset to a file called **WearableData.RData**.


## Variables of **WearableData** dataset

The **WearableData.RData**.RData** contains the tidy dataset obtained after step 16 above and can be loaded into an R session using the load command as shown below. The variables of this dataset are also shown using the **names()** function in R. 


```r
load("WearableData.RData")
names(WearableData)
```

```
##  [1] "subjectid"                     "description"                  
##  [3] "tBodyAcc.mean.X"               "tBodyAcc.mean.Y"              
##  [5] "tBodyAcc.mean.Z"               "tBodyAcc.std.X"               
##  [7] "tBodyAcc.std.Y"                "tBodyAcc.std.Z"               
##  [9] "tGravityAcc.mean.X"            "tGravityAcc.mean.Y"           
## [11] "tGravityAcc.mean.Z"            "tGravityAcc.std.X"            
## [13] "tGravityAcc.std.Y"             "tGravityAcc.std.Z"            
## [15] "tBodyAccJerk.mean.X"           "tBodyAccJerk.mean.Y"          
## [17] "tBodyAccJerk.mean.Z"           "tBodyAccJerk.std.X"           
## [19] "tBodyAccJerk.std.Y"            "tBodyAccJerk.std.Z"           
## [21] "tBodyGyro.mean.X"              "tBodyGyro.mean.Y"             
## [23] "tBodyGyro.mean.Z"              "tBodyGyro.std.X"              
## [25] "tBodyGyro.std.Y"               "tBodyGyro.std.Z"              
## [27] "tBodyGyroJerk.mean.X"          "tBodyGyroJerk.mean.Y"         
## [29] "tBodyGyroJerk.mean.Z"          "tBodyGyroJerk.std.X"          
## [31] "tBodyGyroJerk.std.Y"           "tBodyGyroJerk.std.Z"          
## [33] "tBodyAccMag.mean"              "tBodyAccMag.std"              
## [35] "tGravityAccMag.mean"           "tGravityAccMag.std"           
## [37] "tBodyAccJerkMag.mean"          "tBodyAccJerkMag.std"          
## [39] "tBodyGyroMag.mean"             "tBodyGyroMag.std"             
## [41] "tBodyGyroJerkMag.mean"         "tBodyGyroJerkMag.std"         
## [43] "fBodyAcc.mean.X"               "fBodyAcc.mean.Y"              
## [45] "fBodyAcc.mean.Z"               "fBodyAcc.std.X"               
## [47] "fBodyAcc.std.Y"                "fBodyAcc.std.Z"               
## [49] "fBodyAcc.meanFreq.X"           "fBodyAcc.meanFreq.Y"          
## [51] "fBodyAcc.meanFreq.Z"           "fBodyAccJerk.mean.X"          
## [53] "fBodyAccJerk.mean.Y"           "fBodyAccJerk.mean.Z"          
## [55] "fBodyAccJerk.std.X"            "fBodyAccJerk.std.Y"           
## [57] "fBodyAccJerk.std.Z"            "fBodyAccJerk.meanFreq.X"      
## [59] "fBodyAccJerk.meanFreq.Y"       "fBodyAccJerk.meanFreq.Z"      
## [61] "fBodyGyro.mean.X"              "fBodyGyro.mean.Y"             
## [63] "fBodyGyro.mean.Z"              "fBodyGyro.std.X"              
## [65] "fBodyGyro.std.Y"               "fBodyGyro.std.Z"              
## [67] "fBodyGyro.meanFreq.X"          "fBodyGyro.meanFreq.Y"         
## [69] "fBodyGyro.meanFreq.Z"          "fBodyAccMag.mean"             
## [71] "fBodyAccMag.std"               "fBodyAccMag.meanFreq"         
## [73] "fBodyBodyAccJerkMag.mean"      "fBodyBodyAccJerkMag.std"      
## [75] "fBodyBodyAccJerkMag.meanFreq"  "fBodyBodyGyroMag.mean"        
## [77] "fBodyBodyGyroMag.std"          "fBodyBodyGyroMag.meanFreq"    
## [79] "fBodyBodyGyroJerkMag.mean"     "fBodyBodyGyroJerkMag.std"     
## [81] "fBodyBodyGyroJerkMag.meanFreq"
```


### Details of each variable:

1. **subjectid** : a unique integer value [1-30] used as an identifier for each of the 30 subjects/volunteers in  the experiment.
2. **description** : a unique description of the activity performed by each subject/volunteer. The value could be 
(**WALKING, WALKING-UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**)
3. **other variables** : detailed description of each of the other variables in this dataset can be obtained from this URL : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Variables of **WearableDataAvg.RData** dataset
The **WearableDataAvg.RData** contains the tidy dataset obtained after step 16 above and can be loaded into an R session using the load command as shown below. The variables of this dataset are also shown using the **names()** function in R. 


```r
load("WearableDataAvg.RData")
names(WearableDataAvg)
```

```
##  [1] "subjectid"                        "description"                     
##  [3] "AvgtBodyAcc.mean.X"               "AvgtBodyAcc.mean.Y"              
##  [5] "AvgtBodyAcc.mean.Z"               "AvgtBodyAcc.std.X"               
##  [7] "AvgtBodyAcc.std.Y"                "AvgtBodyAcc.std.Z"               
##  [9] "AvgtGravityAcc.mean.X"            "AvgtGravityAcc.mean.Y"           
## [11] "AvgtGravityAcc.mean.Z"            "AvgtGravityAcc.std.X"            
## [13] "AvgtGravityAcc.std.Y"             "AvgtGravityAcc.std.Z"            
## [15] "AvgtBodyAccJerk.mean.X"           "AvgtBodyAccJerk.mean.Y"          
## [17] "AvgtBodyAccJerk.mean.Z"           "AvgtBodyAccJerk.std.X"           
## [19] "AvgtBodyAccJerk.std.Y"            "AvgtBodyAccJerk.std.Z"           
## [21] "AvgtBodyGyro.mean.X"              "AvgtBodyGyro.mean.Y"             
## [23] "AvgtBodyGyro.mean.Z"              "AvgtBodyGyro.std.X"              
## [25] "AvgtBodyGyro.std.Y"               "AvgtBodyGyro.std.Z"              
## [27] "AvgtBodyGyroJerk.mean.X"          "AvgtBodyGyroJerk.mean.Y"         
## [29] "AvgtBodyGyroJerk.mean.Z"          "AvgtBodyGyroJerk.std.X"          
## [31] "AvgtBodyGyroJerk.std.Y"           "AvgtBodyGyroJerk.std.Z"          
## [33] "AvgtBodyAccMag.mean"              "AvgtBodyAccMag.std"              
## [35] "AvgtGravityAccMag.mean"           "AvgtGravityAccMag.std"           
## [37] "AvgtBodyAccJerkMag.mean"          "AvgtBodyAccJerkMag.std"          
## [39] "AvgtBodyGyroMag.mean"             "AvgtBodyGyroMag.std"             
## [41] "AvgtBodyGyroJerkMag.mean"         "AvgtBodyGyroJerkMag.std"         
## [43] "AvgfBodyAcc.mean.X"               "AvgfBodyAcc.mean.Y"              
## [45] "AvgfBodyAcc.mean.Z"               "AvgfBodyAcc.std.X"               
## [47] "AvgfBodyAcc.std.Y"                "AvgfBodyAcc.std.Z"               
## [49] "AvgfBodyAcc.meanFreq.X"           "AvgfBodyAcc.meanFreq.Y"          
## [51] "AvgfBodyAcc.meanFreq.Z"           "AvgfBodyAccJerk.mean.X"          
## [53] "AvgfBodyAccJerk.mean.Y"           "AvgfBodyAccJerk.mean.Z"          
## [55] "AvgfBodyAccJerk.std.X"            "AvgfBodyAccJerk.std.Y"           
## [57] "AvgfBodyAccJerk.std.Z"            "AvgfBodyAccJerk.meanFreq.X"      
## [59] "AvgfBodyAccJerk.meanFreq.Y"       "AvgfBodyAccJerk.meanFreq.Z"      
## [61] "AvgfBodyGyro.mean.X"              "AvgfBodyGyro.mean.Y"             
## [63] "AvgfBodyGyro.mean.Z"              "AvgfBodyGyro.std.X"              
## [65] "AvgfBodyGyro.std.Y"               "AvgfBodyGyro.std.Z"              
## [67] "AvgfBodyGyro.meanFreq.X"          "AvgfBodyGyro.meanFreq.Y"         
## [69] "AvgfBodyGyro.meanFreq.Z"          "AvgfBodyAccMag.mean"             
## [71] "AvgfBodyAccMag.std"               "AvgfBodyAccMag.meanFreq"         
## [73] "AvgfBodyBodyAccJerkMag.mean"      "AvgfBodyBodyAccJerkMag.std"      
## [75] "AvgfBodyBodyAccJerkMag.meanFreq"  "AvgfBodyBodyGyroMag.mean"        
## [77] "AvgfBodyBodyGyroMag.std"          "AvgfBodyBodyGyroMag.meanFreq"    
## [79] "AvgfBodyBodyGyroJerkMag.mean"     "AvgfBodyBodyGyroJerkMag.std"     
## [81] "AvgfBodyBodyGyroJerkMag.meanFreq"
```


### Details of each variable:

1. **subjectid** : a unique integer value [1-30] used as an identifier for each of the 30 subjects/volunteers in  the experiment.
2. **description** : a unique description of the activity performed by each subject/volunteer. The value could be 
(**WALKING, WALKING-UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**)
3. **other variables** : each other variable in this dataset records the average of a corresponding variable in the **WearableData.RData** dataset discussed in the previous section.
