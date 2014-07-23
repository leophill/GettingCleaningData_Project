# Getting and Cleaning Data Course Project
---------------------------------------
The purpose of this project to show results from collecting and cleaning data pertaining to human activity recognition using smartphones, a typical example of the trendy and exciting area of wearable computing.

1. The raw data
===============
The data used were collected from the accelerometers from the Samsung Galaxy S smartphone. These were made available on the  [UCI Machine Learning Repositorw web site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and through [Coursera's platform](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  

For each record in the dataset, the following attributes were provided: 

*   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
*   Triaxial Angular velocity from the gyroscope. 
*   A 561-feature vector with time and frequency domain variables. 
*   Its activity label. 
*   An identifier of the subject who carried out the experiment.

2. The tidy data
===============
This data was generated as a result of cleaning and transforming the raw data, through R  code processing, into a format suitable for further analysis. The resulting data was stored in the "TidyData_Wearable.csv" file attached in the present repository. Two additional tidy data for the average measurement values across activities and subjects, are also included in long and wide formats. 

3. The code book
===============
A code book describing the structure of the tidy data file has been attached in the repository. This mentions the names of various fields in the file and their data types.

4. The run_analysis R script
===============
This R script was used to clean and transform the raw data in order to generate the tidy data. Details of the code appear in the attached run_analysis.R script file.



Contributors
====================

[Leopold Hillah](mailto:leopold.hill@gmail.com) - Wrote the initial version.
