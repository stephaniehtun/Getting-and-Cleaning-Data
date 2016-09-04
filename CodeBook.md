# CodeBook
all the variables and summaries calculated, along with units, and any other relevant information.

## Raw Data 
### Source: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Raw Data Processing Steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.The tidy data set was output to tidy.csv file.
### run_analysis.R implements the above five steps


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
     
