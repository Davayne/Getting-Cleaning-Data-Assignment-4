This document highlights the features, variables & Transformations made to the Human Activity Recognition Using Smartphones Dataset for Completing Assignment 4 of Getting & Cleaning Data Course.

The data contained is summarized version of some components (variables)  within the Human Activity Recognition Using Smartphones Dataset.

First, the analysis combined both the Training set & Test set from the above mentioned data set.
The data set contained measurements from 30 volunteers who performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope measurements various signals were taken and used to deveop a variety of variables.

A full detailed description of that dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Now, the data in my analysis extracted from the Human Activity Recognition Data set, all variables that were measurements on the mean and standard deviation for each measurement along with the corresponding Activities and Subjects who performed the Activity.
 
The Variable names were changed from what existed in the original data set to more descriptive labels and tidy labels.
The data was then summarized to give the average value for each variable for each activity and for each subject within the extracted dataset.


The finalized dataset contained: 180 Obs. of 68 Variables

30 Subjects (ranging from 1 to 30)
6 Activities (Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, Laying)

The other variables are: 

 [1] "subject"                                                 "activity"                                               
 [3] "MeanBodyAccelerometerX"                                  "MeanBodyAccelerometerY"                                 
 [5] "MeanBodyAccelerometerZ"                                  "StandardDeviationBodyAccelerometerX"                    
 [7] "StandardDeviationBodyAccelerometerY"                     "StandardDeviationBodyAccelerometerZ"                    
 [9] "MeanGravityAccelerometerX"                               "MeanGravityAccelerometerY"                              
[11] "MeanGravityAccelerometerZ"                               "StandardDeviationGravityAccelerometerX"                 
[13] "StandardDeviationGravityAccelerometerY"                  "StandardDeviationGravityAccelerometerZ"                 
[15] "MeanBodyAccelerometerJerkX"                              "MeanBodyAccelerometerJerkY"                             
[17] "MeanBodyAccelerometerJerkZ"                              "StandardDeviationBodyAccelerometerJerkX"                
[19] "StandardDeviationBodyAccelerometerJerkY"                 "StandardDeviationBodyAccelerometerJerkZ"                
[21] "MeanBodyGyrometerX"                                      "MeanBodyGyrometerY"                                     
[23] "MeanBodyGyrometerZ"                                      "StandardDeviationBodyGyrometerX"                        
[25] "StandardDeviationBodyGyrometerY"                         "StandardDeviationBodyGyrometerZ"                        
[27] "MeanBodyGyrometerJerkX"                                  "MeanBodyGyrometerJerkY"                                 
[29] "MeanBodyGyrometerJerkZ"                                  "StandardDeviationBodyGyrometerJerkX"                    
[31] "StandardDeviationBodyGyrometerJerkY"                     "StandardDeviationBodyGyrometerJerkZ"                    
[33] "MeanBodyAccelerometerMagnitude"                          "StandardDeviationBodyAccelerometerMagnitude"            
[35] "MeanGravityAccelerometerMagnitude"                       "StandardDeviationGravityAccelerometerMagnitude"         
[37] "MeanBodyAccelerometerJerkMagnitude"                      "StandardDeviationBodyAccelerometerJerkMagnitude"        
[39] "MeanBodyGyrometerMagnitude"                              "StandardDeviationBodyGyrometerMagnitude"                
[41] "MeanBodyGyrometerJerkMagnitude"                          "StandardDeviationBodyGyrometerJerkMagnitude"            
[43] "MeanFourierBodyAcceleratorX"                             "MeanFourierBodyAcceleratorY"                            
[45] "MeanFourierBodyAcceleratorZ"                             "StandardDeviationFourierBodyAcceleratorX"               
[47] "StandardDeviationFourierBodyAcceleratorY"                "StandardDeviationFourierBodyAcceleratorZ"               
[49] "MeanFourierBodyAcceleratorJerkX"                         "MeanFourierBodyAcceleratorJerkY"                        
[51] "MeanFourierBodyAcceleratorJerkZ"                         "StandardDeviationFourierBodyAcceleratorJerkX"           
[53] "StandardDeviationFourierBodyAcceleratorJerkY"            "StandardDeviationFourierBodyAcceleratorJerkZ"           
[55] "MeanFourierBodyGyrometerX"                               "MeanFourierBodyGyrometerY"                              
[57] "MeanFourierBodyGyrometerZ"                               "StandardDeviationFourierBodyGyrometerX"                 
[59] "StandardDeviationFourierBodyGyrometerY"                  "StandardDeviationFourierBodyGyrometerZ"                 
[61] "MeanFourierBodyAcceleratorMagnitude"                     "StandardDeviationFourierBodyAcceleratorMagnitude"       
[63] "MeanFourierBodyBodyAcceleratorJerkMagnitude"             "StandardDeviationFourierBodyBodyAccleratorJerkMagnitude"
[65] "MeanFourierBodyBodyGyrometerMagnitude"                   "StandardDeviationFourierBodyBodyGyrometerMagnitude"     
[67] "MeanFourierBodyBodyGyrometerJerkMagnitude"               "StandardDeviationFourierBodyBodyGyrometerJerkMagnitude"
 
 
Here variables that start with 'Mean' represent the average value for that variable for that activity & Subject.
Variables that start with StandardDeviation represent the standard deviation for that variable for that activity & Subject.

All quantitative variables without 'Fourier' in their names are time domain signals.
All quantitative variables with 'Fourier' in their names are frequency domain signals

BodyAccelerometer Variables represent body Acceleration Signals
BodyGyrometer Variables represent body Gyrometer Signals
GravityAccelerometer Variables represent Gravity Acceleration Signals
GravityGyrometer Variables represent Gravity Gyrometer Signals
Jerk Variables variables represent Jerk Signals (body linear acceleration and angular velocity)

The X,Y,Z seen at end of some variables represent 3-axial signals in the X, Y and Z directions
