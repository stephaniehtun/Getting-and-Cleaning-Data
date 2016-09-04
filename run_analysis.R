#load packages and set working directory 
library(plyr)
library(data.table)
setwd("C:/Users/san/OneDrive/Education/coursea/Data Science/3-Data Cleaning/Week4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set.

#load data
subject_Train = read.table('./train/subject_train.txt',header=FALSE)
x_Train = read.table('./train/x_train.txt',header=FALSE)
y_Train = read.table('./train/y_train.txt',header=FALSE)

subject_Test = read.table('./test/subject_test.txt',header=FALSE)
x_Test = read.table('./test/x_test.txt',header=FALSE)
y_Test = read.table('./test/y_test.txt',header=FALSE)

# combine raw data sets
x_Data <- rbind(x_Train, x_Test)
y_Data <- rbind(y_Train, y_Test)
subject_Data <- rbind(subject_Train, subject_Test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# determine which columb contain mean or std and extract 
x_Data_mean_std <- x_Data[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(x_Data_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 


# 3. Uses descriptive activity names to name the activities in the data set
y_Data[, 1] <- read.table("activity_labels.txt")[y_Data[, 1], 2]
names(y_Data) <- "Activity"


# 4. Appropriately labels the data set with descriptive variable names.

names(subject_Data) <- "Subject"

# combibe data set into a single one
new_Data <- cbind(x_Data_mean_std,y_Data,subject_Data)

# make variables names descriptive
names(new_Data) <- make.names(names(new_Data))
names(new_Data) <- gsub('^t',"Time",names(new_Data))
names(new_Data) <- gsub('^f',"Frequency",names(new_Data))
names(new_Data) <- gsub('Freq\\.',"Frequency.",names(new_Data))
names(new_Data) <- gsub('Freq$',"Frequency",names(new_Data))
names(new_Data) <- gsub('\\.mean',".Mean",names(new_Data))
names(new_Data) <- gsub('\\.std',".Standard Deviation",names(new_Data))
names(new_Data) <- gsub('Acc',"Acceleration",names(new_Data))
names(new_Data) <- gsub('GyroJerk',"AngularAcceleration",names(new_Data))
names(new_Data) <- gsub('Gyro',"AngularSpeed",names(new_Data))
names(new_Data) <- gsub('Mag',"Magnitude",names(new_Data))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

new_Data2 <- aggregate(.~Subject + Activity, new_Data, mean)
new_Data2 <- new_Data2[order(new_Data2$Subject,new_Data2$Activity),]
write.csv(new_Data2,"tidy.csv",row.names = FALSE)






