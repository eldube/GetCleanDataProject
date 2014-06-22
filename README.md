# README FILE
# Getting and Cleaning Data Project

## Purpose

The purpose of the project was to consolidate (make tidy) the Human Activity Recognition Using Smartphones Dataset Version 1.0 (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which is stored in several files and folders, into a single tidy dataset. Explained below are the resulting consolidated files.

## The files 
All the resulting files for this project can be accessed from the following github repository : https://github.com/eldube/GetCleanDataProject.git .
A brief description of each file in the repository is given below:

 - **README.md**  - this file
 
 - **CodeBook.md** - Explains how the data was consolidated from several text files into a single dataset, and provides a brief description of the
 resulting dataset.
 
 - **run_analysis.R** - the R scripts containing the commands used to get the data, process it, and merge into a single file. The process is also dicussed in the file **CodeBook.md** .
 
 - **WearableData.RData** - file containing the consolidated (tidy) dataset (after part 4 of the project tasks). This file is created 
    by running the *run_analysis.R* script.
 
 - **WearableDataAvg.RData** - file containing the consolidate (tidy) averages  dataset (part 5 of the project tasks). This file is created 
    by running the *run_analysis.R* script.

The **run_analysis.R** will also creates the following support files and folders in the working directory

- **projData.zip** - the downloaded compressed file containing the original dataset.
- **UCI HAR Dataset** - a folder created when the downloaded zip file is unzipped. The contents of this folder are highlighted in more detail in the **CodeBook.md** file.

*Other files in the repository include .Rmd and .html files. These files are used to generate the .md files using R markdown and  knitr. To view the files you only need to open the .md files.*
