# run_analysis.R

# Step 1 : Merge the training and the test sets to create one data set.

activities <- read.table('UCI_HAR_Dataset/activity_labels.txt')
names(activities) <- c('activityid', 'activityname' )

features <- read.table('UCI_HAR_Dataset/features.txt', stringsAsFactors = FALSE)
names(features) <- c('index','featurename')

xtest <- read.table('UCI_HAR_Dataset/test/X_test.txt')
ytest <- read.table('UCI_HAR_Dataset/test/y_test.txt')
stest <- read.table('UCI_HAR_Dataset/test/subject_test.txt')
test <- cbind(stest, ytest, xtest)
rm(xtest, ytest, stest)

xtrain <- read.table('UCI_HAR_Dataset/train/X_train.txt')
ytrain <- read.table('UCI_HAR_Dataset/train/y_train.txt')
strain <- read.table('UCI_HAR_Dataset/train/subject_train.txt')
train <- cbind(strain, ytrain, xtrain)
rm(xtrain, ytrain, strain)

all <- rbind(test, train)
rm(test, train)

names(all) <- c('subjectid', 'activityid', features$featurename)

# Extracts only the measurements on the mean and standard deviation for each measurement.
indx <- grepl('subjectid|activityid|\\-mean\\(\\)|\\-std\\(\\)', colnames(all)) # parenthesis included in regex to filter out column names like meanFreq()
filtered <- all[indx]

# Replace activity id by activity name
library(dplyr)
result <- filtered %>% left_join(activities, by = "activityid") %>% select(-activityid)


