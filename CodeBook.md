# CodeBook
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Raw Data 
### Source: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Raw Data Processing Steps

### Run_analysis.R implements the following five steps
#### 1. Merges the training and the test sets to create one data set.
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
        
        > names(subject_Data)
        [1] "Subject"

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        # determine which columb contain mean or std and extract 
        x_Data_mean_std <- x_Data[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
        names(x_Data_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 

        > names(x_Data_mean_std)
        [1]  "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
        [5]  "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
        [9]  "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
        [13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
        [17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
        [21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
        [25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
        [29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
        [33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
        [37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
        [41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
        [45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
        [49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
        [53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
        [57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
        [61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
        [65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

#### 3. Uses descriptive activity names to name the activities in the data set
        y_Data[, 1] <- read.table("activity_labels.txt")[y_Data[, 1], 2]
        names(y_Data) <- "Activity"

#### 4. Appropriately labels the data set with descriptive variable names.

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

            > names(new_Data)
             [1] "TimeBodyAcceleration.Mean...X"                                      "TimeBodyAcceleration.Mean...Y"                             
             [3] "TimeBodyAcceleration.Mean...Z"                                      "TimeBodyAcceleration.Standard Deviation...X"                       
             [5] "TimeBodyAcceleration.Standard Deviation...Y"                        "TimeBodyAcceleration.Standard Deviation...Z"                       
             [7] "TimeGravityAcceleration.Mean...X"                                   "TimeGravityAcceleration.Mean...Y"                                  
             [9] "TimeGravityAcceleration.Mean...Z"                                   "TimeGravityAcceleration.Standard Deviation...X"                    
            [11] "TimeGravityAcceleration.Standard Deviation...Y"                     "TimeGravityAcceleration.Standard Deviation...Z"                    
            [13] "TimeBodyAccelerationJerk.Mean...X"                                  "TimeBodyAccelerationJerk.Mean...Y"                                 
            [15] "TimeBodyAccelerationJerk.Mean...Z"                                  "TimeBodyAccelerationJerk.Standard Deviation...X"                   
            [17] "TimeBodyAccelerationJerk.Standard Deviation...Y"                    "TimeBodyAccelerationJerk.Standard Deviation...Z"                   
            [19] "TimeBodyAngularSpeed.Mean...X"                                      "TimeBodyAngularSpeed.Mean...Y"                                     
            [21] "TimeBodyAngularSpeed.Mean...Z"                                      "TimeBodyAngularSpeed.Standard Deviation...X"                       
            [23] "TimeBodyAngularSpeed.Standard Deviation...Y"                        "TimeBodyAngularSpeed.Standard Deviation...Z"                       
            [25] "TimeBodyAngularAcceleration.Mean...X"                               "TimeBodyAngularAcceleration.Mean...Y"                              
            [27] "TimeBodyAngularAcceleration.Mean...Z"                               "TimeBodyAngularAcceleration.Standard Deviation...X"                
            [29] "TimeBodyAngularAcceleration.Standard Deviation...Y"                 "TimeBodyAngularAcceleration.Standard Deviation...Z"                
            [31] "TimeBodyAccelerationMagnitude.Mean.."                               "TimeBodyAccelerationMagnitude.Standard Deviation.."                
            [33] "TimeGravityAccelerationMagnitude.Mean.."                            "TimeGravityAccelerationMagnitude.Standard Deviation.."             
            [35] "TimeBodyAccelerationJerkMagnitude.Mean.."                           "TimeBodyAccelerationJerkMagnitude.Standard Deviation.."            
            [37] "TimeBodyAngularSpeedMagnitude.Mean.."                               "TimeBodyAngularSpeedMagnitude.Standard Deviation.."                
            [39] "TimeBodyAngularAccelerationMagnitude.Mean.."                        "TimeBodyAngularAccelerationMagnitude.Standard Deviation.."         
            [41] "FrequencyBodyAcceleration.Mean...X"                                 "FrequencyBodyAcceleration.Mean...Y"                                
            [43] "FrequencyBodyAcceleration.Mean...Z"                                 "FrequencyBodyAcceleration.Standard Deviation...X"                  
            [45] "FrequencyBodyAcceleration.Standard Deviation...Y"                   "FrequencyBodyAcceleration.Standard Deviation...Z"                  
            [47] "FrequencyBodyAccelerationJerk.Mean...X"                             "FrequencyBodyAccelerationJerk.Mean...Y"                            
            [49] "FrequencyBodyAccelerationJerk.Mean...Z"                             "FrequencyBodyAccelerationJerk.Standard Deviation...X"              
            [51] "FrequencyBodyAccelerationJerk.Standard Deviation...Y"               "FrequencyBodyAccelerationJerk.Standard Deviation...Z"              
            [53] "FrequencyBodyAngularSpeed.Mean...X"                                 "FrequencyBodyAngularSpeed.Mean...Y"                                
            [55] "FrequencyBodyAngularSpeed.Mean...Z"                                 "FrequencyBodyAngularSpeed.Standard Deviation...X"                  
            [57] "FrequencyBodyAngularSpeed.Standard Deviation...Y"                   "FrequencyBodyAngularSpeed.Standard Deviation...Z"                  
            [59] "FrequencyBodyAccelerationMagnitude.Mean.."                          "FrequencyBodyAccelerationMagnitude.Standard Deviation.."           
            [61] "FrequencyBodyBodyAccelerationJerkMagnitude.Mean.."                  "FrequencyBodyBodyAccelerationJerkMagnitude.Standard Deviation.."   
            [63] "FrequencyBodyBodyAngularSpeedMagnitude.Mean.."                      "FrequencyBodyBodyAngularSpeedMagnitude.Standard Deviation.."       
            [65] "FrequencyBodyBodyAngularAccelerationMagnitude.Mean.."               "FrequencyBodyBodyAngularAccelerationMagnitude.Standard Deviation.."
            [67] "Activity"                                                           "Subject"                                                           

#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.The tidy data set was output to tidy.csv file.

        new_Data2 <- aggregate(.~Subject + Activity, new_Data, mean)
        new_Data2 <- new_Data2[order(new_Data2$Subject,new_Data2$Activity),]
        write.csv(new_Data2,"tidy.csv",row.names = FALSE)
        
        > head(new_Data2,10)
        
                
            Subject           Activity TimeBodyAcceleration.Mean...X TimeBodyAcceleration.Mean...Y
                  1             LAYING                     0.2215982                  -0.040513953
                  1            SITTING                     0.2612376                  -0.001308288
                  1           STANDING                     0.2789176                  -0.016137590
                  1            WALKING                     0.2773308                  -0.017383819
                  1 WALKING_DOWNSTAIRS                     0.2891883                  -0.009918505
                  1   WALKING_UPSTAIRS                     0.2554617                  -0.023953149
                  2             LAYING                     0.2813734                  -0.018158740
                  2            SITTING                     0.2770874                  -0.015687994
                  2           STANDING                     0.2779115                  -0.018420827
                  2            WALKING                     0.2764266                  -0.018594920





## Tidy Data Set Summary
### Subjects: 
    30 integer subjects
### Activity: 
    6 activity names in string: 
     1. Laying
     2. Sitting
     3. Standing
     4. Walking, 
     5. Walking DownStairs
     6. Walking UpStairs
### Mean and Standard Deviation Measurements:
All measuremnent values are floating point numbers

     TimeBodyAcceleration.Mean...X                                     
     TimeBodyAcceleration.Mean...Y                                    
     TimeBodyAcceleration.Mean...Z                                     
     TimeBodyAcceleration.Standard Deviation...X                       
     TimeBodyAcceleration.Standard Deviation...Y                       
     TimeBodyAcceleration.Standard Deviation...Z                       
     TimeGravityAcceleration.Mean...X                                  
     TimeGravityAcceleration.Mean...Y                                  
     TimeGravityAcceleration.Mean...Z                                  
     TimeGravityAcceleration.Standard Deviation...X                    
     TimeGravityAcceleration.Standard Deviation...Y                    
     TimeGravityAcceleration.Standard Deviation...Z                    
     TimeBodyAccelerationJerk.Mean...X                                 
     TimeBodyAccelerationJerk.Mean...Y                                 
     TimeBodyAccelerationJerk.Mean...Z                                 
     TimeBodyAccelerationJerk.Standard Deviation...X                   
     TimeBodyAccelerationJerk.Standard Deviation...Y                   
     TimeBodyAccelerationJerk.Standard Deviation...Z                   
     TimeBodyAngularSpeed.Mean...X                                     
     TimeBodyAngularSpeed.Mean...Y                                     
     TimeBodyAngularSpeed.Mean...Z                                     
     TimeBodyAngularSpeed.Standard Deviation...X                       
     TimeBodyAngularSpeed.Standard Deviation...Y                       
     TimeBodyAngularSpeed.Standard Deviation...Z                       
     TimeBodyAngularAcceleration.Mean...X                              
     TimeBodyAngularAcceleration.Mean...Y                             
     TimeBodyAngularAcceleration.Mean...Z                              
     TimeBodyAngularAcceleration.Standard Deviation...X                
     TimeBodyAngularAcceleration.Standard Deviation...Y                
     TimeBodyAngularAcceleration.Standard Deviation...Z                
     TimeBodyAccelerationMagnitude.Mean..                              
     TimeBodyAccelerationMagnitude.Standard Deviation..                
     TimeGravityAccelerationMagnitude.Mean..                           
     TimeGravityAccelerationMagnitude.Standard Deviation..             
     TimeBodyAccelerationJerkMagnitude.Mean..                          
     TimeBodyAccelerationJerkMagnitude.Standard Deviation..            
     TimeBodyAngularSpeedMagnitude.Mean..                              
     TimeBodyAngularSpeedMagnitude.Standard Deviation..                
     TimeBodyAngularAccelerationMagnitude.Mean..                       
     TimeBodyAngularAccelerationMagnitude.Standard Deviation..         
     FrequencyBodyAcceleration.Mean...X                                
     FrequencyBodyAcceleration.Mean...Y                                
     FrequencyBodyAcceleration.Mean...Z                                
     FrequencyBodyAcceleration.Standard Deviation...X                  
     FrequencyBodyAcceleration.Standard Deviation...Y                  
     FrequencyBodyAcceleration.Standard Deviation...Z                  
     FrequencyBodyAccelerationJerk.Mean...X                             
     FrequencyBodyAccelerationJerk.Mean...Y                             
     FrequencyBodyAccelerationJerk.Mean...Z                            
     FrequencyBodyAccelerationJerk.Standard Deviation...X              
     FrequencyBodyAccelerationJerk.Standard Deviation...Y              
     FrequencyBodyAccelerationJerk.Standard Deviation...Z              
     FrequencyBodyAngularSpeed.Mean...X                                
     FrequencyBodyAngularSpeed.Mean...Y                                
     FrequencyBodyAngularSpeed.Mean...Z                                
     FrequencyBodyAngularSpeed.Standard Deviation...X                  
     FrequencyBodyAngularSpeed.Standard Deviation...Y                  
     FrequencyBodyAngularSpeed.Standard Deviation...Z                  
     FrequencyBodyAccelerationMagnitude.Mean..                         
     FrequencyBodyAccelerationMagnitude.Standard Deviation..           
     FrequencyBodyBodyAccelerationJerkMagnitude.Mean..                 
     FrequencyBodyBodyAccelerationJerkMagnitude.Standard Deviation..   
     FrequencyBodyBodyAngularSpeedMagnitude.Mean..                     
     FrequencyBodyBodyAngularSpeedMagnitude.Standard Deviation..       
     FrequencyBodyBodyAngularAccelerationMagnitude.Mean..              
     FrequencyBodyBodyAngularAccelerationMagnitude.Standard Deviation..
     
