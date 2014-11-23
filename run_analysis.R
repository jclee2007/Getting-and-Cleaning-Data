#  Step 1A:  Get features
setwd("C:/Users/jlee/Documents/Data Science/Getting Data/UCI HAR Dataset/")
#  Read in features.txt which contains the 561 feature names
features <- read.table("features.txt")


#  Step 1B:  Get and process TRAIN data set
setwd("C:/Users/jlee/Documents/Data Science/Getting Data/UCI HAR Dataset/train")
#  Read in x_train which contains 561 features (columns) and 7352 training observations
x_train <- read.table("X_train.txt")
#  Lets rename x_train columns with feature names
names(x_train) <- features$V2
#  Read in the subjects for train, which comprised of 21 integers (out of 30)
subject_train <- read.table("subject_train.txt")
#  Let set the vector name to subject
names(subject_train) <- "subject"
#  Read in y_train which contains an integer variable (range from 1 to 6) for 7352 
#  train observations which correspond to the activities:  
#  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
y_train <- read.table("y_train.txt")  
#  Let's rename the y_train as "activities"
names(y_train) <- "activity"
# Lets column bind the "activities", "subject" and "features" for the training data set
train <- cbind(y_train,subject_train,x_train)


#  STEP 1C: Get and process the TEST data set
setwd("C:/Users/jlee/Documents/Data Science/Getting Data/UCI HAR Dataset/test")
#  Read in x_test which contains 561 features (columns) and 2947 test observations
x_test <- read.table("X_test.txt")
#  Let's rename x_train columns with feature names
names(x_test) <- features$V2
#  Read in the subjects for test, which comprised of 9 integers (out of 30)
subject_test <- read.table("subject_test.txt")
#  Let set the vector name to subject
names(subject_test) <- "subject"
#  Read in y_test which contains an integer variable (range from 1 to 6) for 2947 test 
#  observations which correspond to the activities:  
#  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
y_test <- read.table("y_test.txt")  
# So, lets rename the y_train as "activity"
names(y_test) <- "activity"
# Lets column bind the "activities", "subject" and "features" for the test data set
test <- cbind(y_test,subject_test,x_test)


#  Step 1D: Merge the training and the test sets to create one data set.
all_data <- rbind(test,train)


#  Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
#  Get column numbers where name contains "activities", "-mean()" or "-std()".  Note we want the mean
#  and standard deviation pairs, which excludes the meanFreq() variables
#  First, create a vector with column numbers we want to include.  Columns 1 & 2 are for
#  "activities" and "subject" respectively.
columns  <- c(1,2,grep("-mean()",names(all_data),fixed=TRUE),grep("-std()",names(all_data),fixed=TRUE))
#  Subset the data frame for only the columns desired into new data frame called mean_std
mean_std <- all_data[,columns]


#  Step 3:  Uses descriptive activity names to name the activities in the data set
mean_std[mean_std$activity == 1,1] <- "WALKING"
mean_std[mean_std$activity == 2,1] <- "WALKING-UPSTAIRS"
mean_std[mean_std$activity == 3,1] <- "WALKING-DOWNSTAIRS"
mean_std[mean_std$activity == 4,1] <- "SITTING"
mean_std[mean_std$activity == 5,1] <- "STANDING"
mean_std[mean_std$activity == 6,1] <- "LAYING"


#  Step 4:  Appropriately labels the data set with descriptive variable names
names(mean_std) <- make.names(names(mean_std),unique=TRUE)

#  Step 5:  From the data set in step 4, creates a second, independent tidy data set with the average 
#  of each variable for each activity and each subject
#  You can double check values from the aggregate function against ouput from this:  
#  mean(mean_std[mean_std$activity == "WALKING" & mean_std$subject ==2,5])
bysubject <- aggregate(mean_std[,3:68],mean_std[,1:2],mean)
#  Now, write the result out to a text file
setwd("C:/Users/jlee/Documents/Data Science/Getting Data/UCI HAR Dataset/")
write.table(bysubject,file="ByAct_BySubject.txt",row.names=FALSE)
