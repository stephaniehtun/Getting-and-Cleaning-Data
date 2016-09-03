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


## Tidy Data Set
### Subjects: 
    30 subjects
### Activity: 
    6 activities: 
     1. Laying
     2. Sitting
     3. Standing
     4. Walking, 
     5. Walking DownStairs
     6. Walking UpStairs
### Measurements: 
 TimeBodyAcc.Mean...X                             
 TimeBodyAcc.Mean...Y                             
 TimeBodyAcc.Mean...Z                             
 TimeBodyAcc.Standard Deviation...X               
 TimeBodyAcc.Standard Deviation...Y               
 TimeBodyAcc.Standard Deviation...Z               
 TimeGravityAcc.Mean...X                          
 TimeGravityAcc.Mean...Y                          
 TimeGravityAcc.Mean...Z                          
 TimeGravityAcc.Standard Deviation...X            
 TimeGravityAcc.Standard Deviation...Y            
 TimeGravityAcc.Standard Deviation...Z            
 TimeBodyAccJerk.Mean...X                         
 TimeBodyAccJerk.Mean...Y                         
 TimeBodyAccJerk.Mean...Z                         
 TimeBodyAccJerk.Standard Deviation...X           
 TimeBodyAccJerk.Standard Deviation...Y           
 TimeBodyAccJerk.Standard Deviation...Z           
 TimeBodyGyro.Mean...X                            
 TimeBodyGyro.Mean...Y                            
 TimeBodyGyro.Mean...Z                            
 TimeBodyGyro.Standard Deviation...X              
 TimeBodyGyro.Standard Deviation...Y              
 TimeBodyGyro.Standard Deviation...Z              
 TimeBodyGyroJerk.Mean...X                        
 TimeBodyGyroJerk.Mean...Y                        
 TimeBodyGyroJerk.Mean...Z                        
 TimeBodyGyroJerk.Standard Deviation...X          
 TimeBodyGyroJerk.Standard Deviation...Y          
 TimeBodyGyroJerk.Standard Deviation...Z          
 TimeBodyAccMag.Mean..                            
 TimeBodyAccMag.Standard Deviation..              
 TimeGravityAccMag.Mean..                         
 TimeGravityAccMag.Standard Deviation..           
 TimeBodyAccJerkMag.Mean..                        
 TimeBodyAccJerkMag.Standard Deviation..          
 TimeBodyGyroMag.Mean..                           
 TimeBodyGyroMag.Standard Deviation..             
 TimeBodyGyroJerkMag.Mean..                       
 TimeBodyGyroJerkMag.Standard Deviation..         
 FrequencyBodyAcc.Mean...X                        
 FrequencyBodyAcc.Mean...Y                        
 FrequencyBodyAcc.Mean...Z                        
 FrequencyBodyAcc.Standard Deviation...X          
 FrequencyBodyAcc.Standard Deviation...Y          
 FrequencyBodyAcc.Standard Deviation...Z         
 FrequencyBodyAccJerk.Mean...X                    
 FrequencyBodyAccJerk.Mean...Y                    
 FrequencyBodyAccJerk.Mean...Z                    
 FrequencyBodyAccJerk.Standard Deviation...X      
 FrequencyBodyAccJerk.Standard Deviation...Y      
 FrequencyBodyAccJerk.Standard Deviation...Z      
 FrequencyBodyGyro.Mean...X                       
 FrequencyBodyGyro.Mean...Y                       
 FrequencyBodyGyro.Mean...Z                       
 FrequencyBodyGyro.Standard Deviation...X         
 FrequencyBodyGyro.Standard Deviation...Y         
 FrequencyBodyGyro.Standard Deviation...Z         
 FrequencyBodyAccMag.Mean..                       
 FrequencyBodyAccMag.Standard Deviation..         
 FrequencyBodyBodyAccJerkMag.Mean..               
 FrequencyBodyBodyAccJerkMag.Standard Deviation.. 
 FrequencyBodyBodyGyroMag.Mean..                  
 FrequencyBodyBodyGyroMag.Standard Deviation..    
 FrequencyBodyBodyGyroJerkMag.Mean..              
 FrequencyBodyBodyGyroJerkMag.Standard Deviation..







