# run_analysis.R

library(dplyr)

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


# Step 2 : Use descriptive activity names to name the activities in the data set
# We take advantage of the names available in the features.txt file
# but we remove symbols (parenthesis and dash) from the names
features$featurename <- gsub('[-()]', '', features$featurename)
names(all) <- c('subjectid', 'activityid', features$featurename)


# Step 3 : Extracts only the measurements on the mean and standard deviation for each measurement.
# We select column names containing appropriate strings

indx <- grepl('subjectid|activityid|mean|std', colnames(all))
filtered <- all[indx]

# Step 4 : Appropriately label the data set with descriptive variable names - Replace activity id by activity name
result <- filtered %>% left_join(activities, by = "activityid") %>% select(-activityid)
rm(filtered, indx)

# Step 5 : From the previous dataset, create a second tidy data set with the average of aech variable for each activity and each subject
result2 <- result %>% group_by(activityname, subjectid) %>% summarise_all(funs(mean))
write.table(result2, row.names = FALSE, file = 'step5.txt')



