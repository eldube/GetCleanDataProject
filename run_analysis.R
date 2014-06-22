##################################################################################################
## run_analysis.R                                                                               ##
## GETTING AND CLEANING DATA PROJECT                                                            ##
##                                                                                              ##
##################################################################################################

##################################################################################################
## DOWNLOADING THE FILES                                                                        ##
##################################################################################################
# Download  zipped file 
wearableDataZipfile <- "projData.zip"
if(!file.exists(wearableDataZipfile) )  {
  fileUrl <- 
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = wearableDataZipfile, method = "internal")
}


## stop if downloading failed or  file "projData.zip" not in working directory
if( !file.exists(wearableDataZipfile) ) {
  stop("Error: StormDataZipfile file is not in the working directory.")
}else {
  ##unzip zip source; files extracted to folder "./UCI HAR Dataset"
  unzip(wearableDataZipfile)
}
## After extraction, the dataset file are stored in a folder called UCI HAR Dataset,
## which further contains two subfolders which randomly divides the dataset into training 
## data (70% of the dataset stored in subfolder "train") and test data (30% of the dataset 
## stored in subfolder "test".

##Since the data is stored in subfolders, the following variables were used for easy 
##reference to path of the data set files.


UCIdataPath <- "./UCI HAR Dataset"  ## main folder;contains folders "train"and "test"
trainDataPath <-  "./UCI HAR Dataset/train" ## path to training data; 70% of data
testDataPath <-  "./UCI HAR Dataset/test" ## path to training data; 30% of data

## Reading feature variable names from features.txt file
## first read feature variable names; from features.txt file
## feature variable names are the same for both training and test data

feature <- read.table(paste(UCIdataPath,"/features.txt", sep=""), 
              colClasses = c("integer","character"), col.names= c("seqNum", "name"), header = FALSE)


## Reading activity labels names from activity_labels.txt file
## activity labels are the same for both training and test data
## The activity labels have a code (integer between 1 and 6) and a name

activityLabel <- read.table(paste(UCIdataPath,"/activity_labels.txt", sep=""), 
               colClasses = c("integer", "character"), col.names= c("code", "name"), header = FALSE)

######################################################################################################
## Reading the traing data from "./UCI HAR Dataset/train" folder                                    ##
## The dataset data is stored in two text files                                                     ##
##  1. X_train.txt : Test Set                                                                       ##
##  2. y_train.txt : Training labels                                                                ##
##  3. subject_train.txt : Volonteer details                                                        ##
######################################################################################################



######################################################################################################
## TASK 3 : ADD DESCRIPTIVE ACTIVIY NAMES TO TRAINING DATA                                          ##
######################################################################################################
##  first read coded training data labels and tranform codes to matching descriptive 
## activity names as tabluated in the the activity labels file (activity_labels.txt)
trainingLabel <- read.table(paste(trainDataPath,"/y_train.txt", sep=""), 
                                                    col.names= c("code"), header = FALSE)

trainingLabel$description <- apply(trainingLabel, 1, function (i) {
     targetActivity <- activityLabel[(activityLabel$code==i),]
     return(targetActivity$name)}  )

## read training data subject/volunteer details from subject_train.txt file
trainingSubjectData <- read.table(paste(trainDataPath,"/subject_train.txt", sep=""), 
                                  colClasses = c("integer"), col.names= c("subjectid"), header = FALSE)


## read trainig set data
trainingData <- read.table(paste(trainDataPath,"/X_train.txt", sep=""))

######################################################################################################
## TASK 4 : ADD DESCRIPTIVE COLUMN/VARIABLE NAMES TO TRAINING DATA  SET                             ##
######################################################################################################
## add descriptive column names to training data using information from features.txt
names(trainingData) <- make.names(feature$name)

## add label descrptions as first column of trainingData; new data should have 562 columns
description <- trainingLabel$description
trainingData <- cbind(description,trainingData)

## add subjectid column as first column of testData using information extracted from subject_train.txt
subjectid <- trainingSubjectData$subjectid
trainingData <- cbind(subjectid,trainingData)

######################################################################################################
## Reading the test data from "./UCI HAR Dataset/test" folder                                       ##
## The dataset data is stored in two text files                                                     ##
##  1. X_test.txt : Test Set                                                                        ##
##  2. y_test.txt : Training labels                                                                 ##
##  3. subject_test.txt : Volonteer details                                                           ##
######################################################################################################



################################################################## ###################################
## TASK 3 : ADD DESCRIPTIVE ACTIVIY NAMES TO TEST DATA                                              ##
######################################################################################################
##  first read coded test data labels and tranform codes to matching descriptive 
## activity names as tabluated in the the activity labels file (activity_labels.txt)
testLabel <- read.table(paste(testDataPath,"/y_test.txt", sep=""),col.names= c("code"),header = FALSE)


testLabel$description <- apply(testLabel, 1, function (i) {
                              targetActivity <- activityLabel[(activityLabel$code==i),]
                              return(targetActivity$name)}  )

## read training data subject/volunteer details from subject_test.txt file
testSubjectData <- read.table(paste(testDataPath,"/subject_test.txt", sep=""),
                              colClasses = c("integer"), col.names= c("subjectid"), header = FALSE)

## read trainig set data
testData <- read.table(paste(testDataPath,"/X_test.txt", sep=""))



######################################################################################################
## TASK 4 : ADD DESCRIPTIVE COLUMN/VARIABLE NAMES TO TEST DATA   SET                               ##
######################################################################################################

## add descriptive column names to test data using information from features.txt
names(testData) <- make.names(feature$name)

## add label descrptions as first column of testData ; should now have 562 columns
description <- testLabel$description
testData <- cbind(description,testData)

## add subjectid column as first column of testData
subjectid <- testSubjectData$subjectid
testData <- cbind(subjectid,testData)

######################################################################################################
## TASK 2 :EXTRACT ONLY MEASUREMENTS ON MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT            ##
######################################################################################################

## find columns measuring mean and std
columnNames <- names(trainingData)
stdColumns <- grep("std", columnNames)
meanColumns <- grep("mean", columnNames)
targetColumns <- sort(c(1,2,stdColumns, meanColumns)) ##include column 1&2--for subjectid & description 

## subset target columns from trainingData data frame; new data frame should have 81 columns
mean_std_trainingData <- trainingData[,targetColumns]

## subset target columns from testData data frame; new data frame should have 80 columns
mean_std_testData <- testData[,targetColumns]

## remove some R objects that are no longer needed to free memory space
#rm( activityLabel,columnNames, description,feature,meanColumns,  stdColumns, targetColumns)
#rm(testLabel, trainingLabel, wearableDataZipfile)

######################################################################################################
## TASK 1: MERGE/COMBINE TRAINING DATA AND TEST DATA                                                ##
######################################################################################################
tidyData <- rbind (mean_std_trainingData, mean_std_testData ) ## should have 10299 rows, 81 columns


######################################################################################################
## TASK 4: MAKE COLUMN/VARIABLE NAMES MORE READABLE                                                 ##
######################################################################################################
columnNames <- names(tidyData)
sub1 <- sub ("\\.\\.\\.", "\\.", columnNames) ## replace 3 consecutive periods with a single period
sub2 <- sub ("\\.\\.", "\\.", sub1)           ## replace 3 consecutive periods with a single period
sub3 <- sub ("\\.$", "", sub2)         ## replace period that appears at the end of a name
columnNames <- sub3
names(tidyData) <- columnNames

## save tidyData to a file
WearableData <- tidyData
save(WearableData, file="WearableData.RData")

######################################################################################################
## TASK 5: CREATE A SECOND INDEPENDENT DATASET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY  ##
## AND SUBJECT                                                                                      ##
######################################################################################################

tidyDataAvg <- aggregate(tidyData, list(subjectid=tidyData$subjectid, description=tidyData$description),
                              FUN=mean,na.rm=TRUE, na.action=NUL)
tidyDataAvg <- tidyDataAvg[,c(1:2,5:ncol(tidyDataAvg))]  ## removes extra columns


## add meaningful column name, reflect fact that columns are averages
avgColumnNames <- names(tidyDataAvg)
prefixLabel <- "Avg"
prefixedColumnNames <- paste(prefixLabel,avgColumnNames[3:length(avgColumnNames)], sep="")
avgColumnNames <- c("subjectid", "description",  prefixedColumnNames)
names(tidyDataAvg) <- avgColumnNames

## Data set to a file
WearableDataAvg <-  tidyDataAvg
save(WearableDataAvg, file="WearableDataAvg.RData")



