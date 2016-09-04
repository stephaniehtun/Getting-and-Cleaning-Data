# CodeBook
all the variables and summaries calculated, along with units, and any other relevant information.

## Raw Data 
### Source: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Raw Data Processing Steps

### run_analysis.R implements the following five steps

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
     
