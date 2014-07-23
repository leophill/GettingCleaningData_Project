# Code Book - Getting and Cleaning Data Course Project

The purpose of this code book is to describe the attached tidy data provided as part of the course project, its metadata as well the code used to arrive at the tidy data from the initial raw data.

1. The Tidy Data File
===============
The name of the file is **TidyData_Wearable.csv**. The data was generated as a result of cleaning and transforming the raw data, through R  code processing, into a format suitable for further analysis.

2. The Data Structure
===============
The structure of the tidy data appears below. The names of the various fields in the file are shown under ***COLUMN NAME*** header, while the corresponding data type appears under ***R DATA TYPE*** column, followed by a description of the type under ***TYPE DESCRIPTION*** header. Sample data is also displayed for each column under ***SAMPLE DATA*** header.

The first two columns represents data on subjects and their activities. All other columns represent either the mean or the standard deviation of measurements about subjects' activities.

|COLUMN NAME    |R DATA TYPE	|TYPE DESCRIPTION	|SAMPLE DATA|
|:------------------------:	|:---------:	|:---------------:	|:---------:|
|SubjectID                       	|int	|Integer	|1|
|Activity.Name                   	|char	|Text	|Walking|
|Time.BodyAcc.Mean.X             	|num	|Numeric	|0.289|
|Time.BodyAcc.Mean.Y             	|num	|Numeric	|-0.0203|
|Time.BodyAcc.Mean.Z             	|num	|Numeric	|-0.133|
|Time.BodyAcc.Stdev.X            	|num	|Numeric	|-0.995|
|Time.BodyAcc.Stdev.Y            	|num	|Numeric	|-0.983|
|Time.BodyAcc.Stdev.Z            	|num	|Numeric	|-0.914|
|Time.GravityAcc.Mean.X          	|num	|Numeric	|0.963|
|Time.GravityAcc.Mean.Y          	|num	|Numeric	|-0.141|
|Time.GravityAcc.Mean.Z          	|num	|Numeric	|0.1154|
|Time.GravityAcc.Stdev.X         	|num	|Numeric	|-0.985|
|Time.GravityAcc.Stdev.Y         	|num	|Numeric	|-0.982|
|Time.GravityAcc.Stdev.Z         	|num	|Numeric	|-0.878|
|Time.BodyAccJerk.Mean.X         	|num	|Numeric	|0.078|
|Time.BodyAccJerk.Mean.Y         	|num	|Numeric	|0.005|
|Time.BodyAccJerk.Mean.Z         	|num	|Numeric	|-0.06783|
|Time.BodyAccJerk.Stdev.X        	|num	|Numeric	|-0.994|
|Time.BodyAccJerk.Stdev.Y        	|num	|Numeric	|-0.988|
|Time.BodyAccJerk.Stdev.Z        	|num	|Numeric	|-0.994|
|Time.BodyGyro.Mean.X            	|num	|Numeric	|-0.0061|
|Time.BodyGyro.Mean.Y            	|num	|Numeric	|-0.0314|
|Time.BodyGyro.Mean.Z            	|num	|Numeric	|0.1077|
|Time.BodyGyro.Stdev.X           	|num	|Numeric	|-0.985|
|Time.BodyGyro.Stdev.Y           	|num	|Numeric	|-0.977|
|Time.BodyGyro.Stdev.Z           	|num	|Numeric	|-0.992|
|Time.BodyGyroJerk.Mean.X        	|num	|Numeric	|-0.0992|
|Time.BodyGyroJerk.Mean.Y        	|num	|Numeric	|-0.0555|
|Time.BodyGyroJerk.Mean.Z        	|num	|Numeric	|-0.062|
|Time.BodyGyroJerk.Stdev.X       	|num	|Numeric	|-0.992|
|Time.BodyGyroJerk.Stdev.Y       	|num	|Numeric	|-0.993|
|Time.BodyGyroJerk.Stdev.Z       	|num	|Numeric	|-0.992|
|Time.BodyAccMag.Mean            	|num	|Numeric	|-0.959|
|Time.BodyAccMag.Stdev           	|num	|Numeric	|-0.951|
|Time.GravityAccMag.Mean         	|num	|Numeric	|-0.959|
|Time.GravityAccMag.Stdev        	|num	|Numeric	|-0.951|
|Time.BodyAccJerkMag.Mean        	|num	|Numeric	|-0.993|
|Time.BodyAccJerkMag.Stdev       	|num	|Numeric	|-0.994|
|Time.BodyGyroMag.Mean           	|num	|Numeric	|-0.969|
|Time.BodyGyroMag.Stdev          	|num	|Numeric	|-0.964|
|Time.BodyGyroJerkMag.Mean       	|num	|Numeric	|-0.994|
|Time.BodyGyroJerkMag.Stdev      	|num	|Numeric	|-0.991|
|FreqDS.BodyAcc.Mean.X           	|num	|Numeric	|-0.995|
|FreqDS.BodyAcc.Mean.Y           	|num	|Numeric	|-0.983|
|FreqDS.BodyAcc.Mean.Z           	|num	|Numeric	|-0.939|
|FreqDS.BodyAcc.Stdev.X          	|num	|Numeric	|-0.995|
|FreqDS.BodyAcc.Stdev.Y          	|num	|Numeric	|-0.983|
|FreqDS.BodyAcc.Stdev.Z          	|num	|Numeric	|-0.906|
|FreqDS.BodyAccJerk.Mean.X       	|num	|Numeric	|-0.992|
|FreqDS.BodyAccJerk.Mean.Y       	|num	|Numeric	|-0.987|
|FreqDS.BodyAccJerk.Mean.Z       	|num	|Numeric	|-0.99|
|FreqDS.BodyAccJerk.Stdev.X      	|num	|Numeric	|-0.996|
|FreqDS.BodyAccJerk.Stdev.Y      	|num	|Numeric	|-0.991|
|FreqDS.BodyAccJerk.Stdev.Z      	|num	|Numeric	|-0.997|
|FreqDS.BodyGyro.Mean.X          	|num	|Numeric	|-0.987|
|FreqDS.BodyGyro.Mean.Y          	|num	|Numeric	|-0.982|
|FreqDS.BodyGyro.Mean.Z          	|num	|Numeric	|-0.99|
|FreqDS.BodyGyro.Stdev.X         	|num	|Numeric	|-0.985|
|FreqDS.BodyGyro.Stdev.Y         	|num	|Numeric	|-0.974|
|FreqDS.BodyGyro.Stdev.Z         	|num	|Numeric	|-0.994|
|FreqDS.BodyAccMag.Mean          	|num	|Numeric	|-0.952|
|FreqDS.BodyAccMag.Stdev         	|num	|Numeric	|-0.956|
|FreqDS.BodyBodyAccJerkMag.Mean  	|num	|Numeric	|-0.994|
|FreqDS.BodyBodyAccJerkMag.Stdev 	|num	|Numeric	|-0.994|
|FreqDS.BodyBodyGyroMag.Mean     	|num	|Numeric	|-0.98|
|FreqDS.BodyBodyGyroMag.Stdev    	|num	|Numeric	|-0.961|
|FreqDS.BodyBodyGyroJerkMag.Mean 	|num	|Numeric	|-0.992|
|FreqDS.BodyBodyGyroJerkMag.Stdev	|num	|Numeric	|-0.991|

3. R Code Snippets
===============
The code used to generate the tiday data, made use of three main R libraries in addition to standard R features, namely **plyr** and **reshape2**. 

Some code snippets follow:

#### Reading Raw Data

```
## Read Test Data

Subject_Test <- read.table(file.path(basedir, "test","subject_test.txt"))
X_Test <- read.table(file.path(basedir, "test","X_test.txt"))
Y_Test <- read.table(file.path(basedir, "test","y_test.txt"))

## Read Training Data

Subject_Train <- read.table(file.path(basedir, "train","subject_train.txt"))
X_Train <- read.table(file.path(basedir, "train","X_train.txt"))
Y_Train <- read.table(file.path(basedir, "train","y_train.txt"))
```

#### Merging Data

```
Subject <- rbind(Subject_Train, Subject_Test)   ## Subjects Data
X <- rbind(X_Train, X_Test)   ## Measurements Data
Y <- rbind(Y_Train, Y_Test)   ## Activities Data
```

##### Extraction of Mean and Standard Deviation

```
Features <- rename(read.table(file.path(basedir, "features.txt")),c("V1"="ID", "V2"="Feature.Name"))
Features <- mutate(Features, FeatureVar = paste0("V",ID)) ## Add FeatureVar column to reference columns in X data frame

FeatureMeanStd <- subset (Features, grepl("-mean\\(\\)|-std\\(\\)",Feature.Name,ignore.case=TRUE)==TRUE)

XMeanStd <- subset(X, select=FeatureMeanStd$FeatureVar)
```

##### Naming activities in the data set

```
ActivityNames <- rename(read.table(file.path(basedir, "activity_labels.txt")),c("V1"="ID", "V2"="Activity.Name"))
Y <- rename(Y,c("V1"="ID"))
Activities <- merge(Y, ActivityNames, by = "ID", all.x = TRUE)
```

##### Tidying Activities and Feature Names

```
simpleCap <- function(x) {
  s2 <- ""
  s1 <- strsplit(x, "_")[[1]]
  s1 <- paste(toupper(substring(s1, 1,1)), tolower(substring(s1, 2)),sep="", collapse=" ")
  x <- s1
  if (length(x) > length(s1)+1) {
    s2 <- strsplit(x, " ")[[2]]
    s2 <- paste(toupper(substring(s2, 1,1)), tolower(substring(s2, 2)),sep="", collapse=" ")
    x <- paste(s1, s2)
}
  return(x)
}

cleanFeature <- function(x) {
  x <- gsub("^t","Time.",x)
  x <- gsub("^f","FreqDS.",x)
  x <- gsub("-mean\\(\\)-*",".Mean.",x)
  x <- gsub("-std\\(\\)-*",".Stdev.",x)
  x <- gsub("\\(\\)$","",x)
  x <- gsub("\\.$","",x)
  return(x)
}

Activities <- ddply(Activities,"ID",transform, Activity.Name=simpleCap(Activity.Name))
FeatureMeanStd <- ddply(FeatureMeanStd,"ID",transform, Feature.Name=cleanFeature(Feature.Name))
```

##### Adding labels to the data with descriptive variable names

```
names(XMeanStd) <- FeatureMeanStd$Feature.Name   # Rename columns of the Measurement Data
Subject <- rename(Subject,c("V1"="SubjectID"))   # Rename ID of Subjects
```

##### Tidying Data Set in wide format

```
TidyData <- mutate(Subject, Activity.Name=Activities$Activity.Name)

TidyData <- cbind(TidyData,XMeanStd)
```

##### Creating a second, independent tidy data set in long format with the average of each variable for each activity and each subject.

```
LongTidyData <- melt(TidyData, id.vars=c("Activity.Name", "SubjectID"), variable.name='Measurement.Name', value.name='Measurement.Value')

LongTidyMean <- ddply(LongTidyData,c("Activity.Name", "SubjectID", "Measurement.Name"), summarize, Average.Value = mean(Measurement.Value))

WideTidyMean <- dcast(LongTidyData,Activity.Name+SubjectID ~ Measurement.Name,value.var='Measurement.Value',mean)
```

##### Generating CSV files with tidy data

```
write.csv(TidyData, file = "TidyData_Wearable.csv",row.names = TRUE)
write.csv(LongTidyMean, file = "Long_TidyMean_Wearable.csv",row.names = TRUE)
write.csv(WideTidyMean, file = "Wide_Tidy_Mean_Wearable.csv",row.names = TRUE)
```



Contributors
====================

[Leopold Hillah](mailto:leopold.hill@gmail.com) - Wrote the initial version.
