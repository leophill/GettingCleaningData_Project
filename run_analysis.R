## Data Acquisition and Cleaning

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="getdata_projectfiles_UCI HAR Dataset.zip",method="curl")

unzip("getdata_projectfiles_UCI HAR Dataset.zip")

## Disable string conversion into factors

options(stringsAsFactors = FALSE)

## Set Data Files Base Directory

basedir <- file.path(".", "UCI HAR Dataset")

## Read Test Data

Subject_Test <- read.table(file.path(basedir, "test","subject_test.txt"))
X_Test <- read.table(file.path(basedir, "test","X_test.txt"))
Y_Test <- read.table(file.path(basedir, "test","y_test.txt"))

## Read Training Data

Subject_Train <- read.table(file.path(basedir, "train","subject_train.txt"))
X_Train <- read.table(file.path(basedir, "train","X_train.txt"))
Y_Train <- read.table(file.path(basedir, "train","y_train.txt"))

## Loading Required Libraries

library(plyr)
library(reshape2)

## Data Merging

Subject <- rbind(Subject_Train, Subject_Test)   ## Subjects Data
X <- rbind(X_Train, X_Test)   ## Measurements Data
Y <- rbind(Y_Train, Y_Test)   ## Activities Data

## Extraction of Mean and Standard Deviation

Features <- rename(read.table(file.path(basedir, "features.txt")),c("V1"="ID", "V2"="Feature.Name"))

Features <- mutate(Features, FeatureVar = paste0("V",ID)) ## Add FeatureVar column to reference columns in X data frame

FeatureMeanStd <- subset (Features, grepl("-mean\\(\\)|-std\\(\\)",Feature.Name,ignore.case=TRUE)==TRUE)

XMeanStd <- subset(X, select=FeatureMeanStd$FeatureVar)

## Naming activities in the data set

ActivityNames <- rename(read.table(file.path(basedir, "activity_labels.txt")),c("V1"="ID", "V2"="Activity.Name"))
Y <- rename(Y,c("V1"="ID"))
Activities <- merge(Y, ActivityNames, by = "ID", all.x = TRUE)

## Tidying Activities and Feature Names (a function could be written to clean up Feature.Name to make it more elegant)

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

### Adding labels to the data with descriptive variable names

names(XMeanStd) <- FeatureMeanStd$Feature.Name   # Rename columns of the Measurement Data
Subject <- rename(Subject,c("V1"="SubjectID"))   # Rename ID of Subjects

## Tidying Data Set in wide format

TidyData <- mutate(Subject, Activity.Name=Activities$Activity.Name)

TidyData <- cbind(TidyData,XMeanStd)

## Creating a second, independent tidy data set in long format with the average of each variable for each activity and each subject.

LongTidyData <- melt(TidyData, id.vars=c("Activity.Name", "SubjectID"), variable.name='Measurement.Name', value.name='Measurement.Value')

LongTidyMean <- ddply(LongTidyData,c("Activity.Name", "SubjectID", "Measurement.Name"), summarize, Average.Value = mean(Measurement.Value))

WideTidyMean <- dcast(LongTidyData,Activity.Name+SubjectID ~ Measurement.Name,value.var='Measurement.Value',mean)

## Generating csv files for both tidy data

write.csv(TidyData, file = "TidyData_Wearable.csv",row.names = TRUE)
write.csv(LongTidyMean, file = "Long_TidyMean_Wearable.csv",row.names = TRUE)
write.csv(WideTidyMean, file = "Wide_Tidy_Mean_Wearable.csv",row.names = TRUE)
