
## Set Working Directory
setwd("C://Users//Devayne//Desktop//Data Specialization Course//Getting & Cleaning Data//Assignment4")

## download needed packages
library(dplyr)

## Step 1: Download Zipfile from Website and save to a folder in Working Directory
if(!file.exists("assignmentdata")){dir.create("assignmentdata")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile="assignmentdata.zip")
dateDownloaded <- date()

## Step 2: Unzip the needed files and read them into various dataframes 
unzip("assignmentdata.zip", list = TRUE)  ## get list of files within the zipped folder

features_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/features.txt", list = FALSE)
features <- read.table(features_zipped, header= FALSE, sep = "", col.names = c("identifier","measures") )

test_label_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/test/y_test.txt", list = FALSE)
test_label <- read.table(test_label_zipped, header= FALSE, sep = "", col.names = "activity")

test_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/test/X_test.txt", list = FALSE)
test <- read.table(test_zipped, header= FALSE, sep = "")
names(test) <- features$measures   ## add column names

test_subject_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/test/subject_test.txt", list = FALSE)
test_subject <- read.table(test_subject_zipped, header= FALSE, sep = "", col.names = "subject")
 
## Step 3: Aggregate the Test file and its corresponding activity & subject labels
test_final <- cbind(test_subject, test_label, test)


## Step 4: Retrieve the Train data   
train_label_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/train/y_train.txt", list = FALSE)
train_label <- read.table(train_label_zipped, header= FALSE, sep = "", col.names = "activity")

train_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/train/X_train.txt", list = FALSE)
train <- read.table(train_zipped, header= FALSE, sep = "")
names(train) <- features$measures ## add column names

train_subject_zipped <- unzip("assignmentdata.zip", "UCI HAR Dataset/train/subject_train.txt", list = FALSE)
train_subject <- read.table(train_subject_zipped, header= FALSE, sep = "", col.names = "subject")

## Step 5:  Aggregate the Training file and its corresponding activity & subject labels
train_final <- cbind(train_subject, train_label, train)



## Step 6: Combine the Test & Training files into one dataframe.
Test_Train_Combined <- rbind(train_final, test_final)   

## get column number of variables with Mean & standard deviation
column_names <- names(Test_Train_Combined)
names_data <-  grep("(mean\\(|std)", column_names)

# get only the columns that have Mean & Standard Deviation 
Test_Train_Filtered <- cbind(Test_Train_Combined[, c(1,2)], data1[, names_data])
Test_Train_Filtered <- arrange(Test_Train_Filtered, subject)

## Convert the Activity & Subject Variable into Factor Variables.
Test_Train_Filtered$activity <- as.factor(Test_Train_Filtered$activity)
## Test_Train_Filtered$subject <- as.factor(Test_Train_Filtered$subject)

## Label the Activity with Descriptive Activity Names
Test_Train_Filtered <- mutate(Test_Train_Filtered, activity = ifelse(activity == 1 , "walking",
                                      ifelse(activity == 2 , "walkingupstairs",
                                      ifelse(activity == 3, "walkingdownstairs" ,
                                      ifelse(activity == 4, "sitting" , 
                                      ifelse(activity == 5, "standing", "laying"))))))

## remove characters "-" & "()" from Variable names
adjustednames <- gsub("\\()","", (gsub("-","",names(Test_Train_Filtered))))
names(Test_Train_Filtered) <- adjustednames

# rename all the variables in data set to make them more descriptive 
renamed_data <- rename(Test_Train_Filtered, 
            MeanBodyAccelerometerX = tBodyAccmeanX,
            MeanBodyAccelerometerY = tBodyAccmeanY,
            MeanBodyAccelerometerZ = tBodyAccmeanZ,
            StandardDeviationBodyAccelerometerX = tBodyAccstdX,
            StandardDeviationBodyAccelerometerY = tBodyAccstdY, 
            StandardDeviationBodyAccelerometerZ = tBodyAccstdZ,
            MeanGravityAccelerometerX = tGravityAccmeanX, 
            MeanGravityAccelerometerY = tGravityAccmeanY, 
            MeanGravityAccelerometerZ = tGravityAccmeanZ,
            StandardDeviationGravityAccelerometerX = tGravityAccstdX,
            StandardDeviationGravityAccelerometerY = tGravityAccstdY,
            StandardDeviationGravityAccelerometerZ = tGravityAccstdZ,
            MeanBodyAccelerometerJerkX = tBodyAccJerkmeanX,
            MeanBodyAccelerometerJerkY = tBodyAccJerkmeanY,
            MeanBodyAccelerometerJerkZ = tBodyAccJerkmeanZ, 
            StandardDeviationBodyAccelerometerJerkX = tBodyAccJerkstdX, 
            StandardDeviationBodyAccelerometerJerkY = tBodyAccJerkstdY,
            StandardDeviationBodyAccelerometerJerkZ = tBodyAccJerkstdZ,
            MeanBodyGyrometerX = tBodyGyromeanX,
            MeanBodyGyrometerY = tBodyGyromeanY, 
            MeanBodyGyrometerZ = tBodyGyromeanZ,
            StandardDeviationBodyGyrometerX =  tBodyGyrostdX, 
            StandardDeviationBodyGyrometerY =  tBodyGyrostdY, 
            StandardDeviationBodyGyrometerZ =  tBodyGyrostdZ,
            MeanBodyGyrometerJerkX = tBodyGyroJerkmeanX, 
            MeanBodyGyrometerJerkY = tBodyGyroJerkmeanY, 
            MeanBodyGyrometerJerkZ = tBodyGyroJerkmeanZ,
            StandardDeviationBodyGyrometerJerkX = tBodyGyroJerkstdX,
            StandardDeviationBodyGyrometerJerkY = tBodyGyroJerkstdY,
            StandardDeviationBodyGyrometerJerkZ = tBodyGyroJerkstdZ,  
            MeanBodyAccelerometerMagnitude =  tBodyAccMagmean, 
            StandardDeviationBodyAccelerometerMagnitude = tBodyAccMagstd,
            MeanGravityAccelerometerMagnitude =  tGravityAccMagmean, 
            StandardDeviationGravityAccelerometerMagnitude = tGravityAccMagstd,
            MeanBodyAccelerometerJerkMagnitude =  tBodyAccJerkMagmean, 
            StandardDeviationBodyAccelerometerJerkMagnitude = tBodyAccJerkMagstd,
            MeanBodyGyrometerMagnitude =  tBodyGyroMagmean, 
            StandardDeviationBodyGyrometerMagnitude = tBodyGyroMagstd,
            MeanBodyGyrometerJerkMagnitude =  tBodyGyroJerkMagmean, 
            StandardDeviationBodyGyrometerJerkMagnitude = tBodyGyroJerkMagstd,
            MeanFourierBodyAcceleratorX = fBodyAccmeanX,
            MeanFourierBodyAcceleratorY = fBodyAccmeanY, 
            MeanFourierBodyAcceleratorZ = fBodyAccmeanZ, 
            StandardDeviationFourierBodyAcceleratorX = fBodyAccstdX, 
            StandardDeviationFourierBodyAcceleratorY = fBodyAccstdY, 
            StandardDeviationFourierBodyAcceleratorZ = fBodyAccstdZ,
            MeanFourierBodyAcceleratorJerkX = fBodyAccJerkmeanX, 
            MeanFourierBodyAcceleratorJerkY = fBodyAccJerkmeanY, 
            MeanFourierBodyAcceleratorJerkZ = fBodyAccJerkmeanZ, 
            StandardDeviationFourierBodyAcceleratorJerkX = fBodyAccJerkstdX, 
            StandardDeviationFourierBodyAcceleratorJerkY = fBodyAccJerkstdY, 
            StandardDeviationFourierBodyAcceleratorJerkZ = fBodyAccJerkstdZ,
            MeanFourierBodyGyrometerX = fBodyGyromeanX, 
            MeanFourierBodyGyrometerY = fBodyGyromeanY,
            MeanFourierBodyGyrometerZ = fBodyGyromeanZ,
            StandardDeviationFourierBodyGyrometerX = fBodyGyrostdX, 
            StandardDeviationFourierBodyGyrometerY = fBodyGyrostdY, 
            StandardDeviationFourierBodyGyrometerZ = fBodyGyrostdZ,
            MeanFourierBodyAcceleratorMagnitude = fBodyAccMagmean,
            StandardDeviationFourierBodyAcceleratorMagnitude = fBodyAccMagstd,
            MeanFourierBodyBodyAcceleratorJerkMagnitude = fBodyBodyAccJerkMagmean,
            StandardDeviationFourierBodyBodyAccleratorJerkMagnitude = fBodyBodyAccJerkMagstd,
            MeanFourierBodyBodyGyrometerMagnitude = fBodyBodyGyroMagmean,
            StandardDeviationFourierBodyBodyGyrometerMagnitude = fBodyBodyGyroMagstd,
            MeanFourierBodyBodyGyrometerJerkMagnitude = fBodyBodyGyroJerkMagmean,
            StandardDeviationFourierBodyBodyGyrometerJerkMagnitude = fBodyBodyGyroJerkMagstd    )
   
 
## partition data by Subject & Activity then summarize to find mean per group.
grouped_data <- group_by(renamed_data, subject, activity)
summarized_data <- summarize(grouped_data,  
                             MeanBodyAccelerometerX = mean(MeanBodyAccelerometerX, na.rm = TRUE), 
                             MeanBodyAccelerometerY = mean(MeanBodyAccelerometerY, na.rm = TRUE),                               
                             MeanBodyAccelerometerZ = mean(MeanBodyAccelerometerZ, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerX = mean(StandardDeviationBodyAccelerometerX, na.rm = TRUE),                    
                             StandardDeviationBodyAccelerometerY = mean(StandardDeviationBodyAccelerometerY, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerZ = mean(StandardDeviationBodyAccelerometerZ, na.rm = TRUE),                    
                             MeanGravityAccelerometerX = mean(MeanGravityAccelerometerX, na.rm = TRUE),
                             MeanGravityAccelerometerY = mean(MeanGravityAccelerometerY, na.rm = TRUE),                             
                             MeanGravityAccelerometerZ = mean(MeanGravityAccelerometerZ, na.rm = TRUE),
                             StandardDeviationGravityAccelerometerX = mean(StandardDeviationGravityAccelerometerX, na.rm = TRUE),                
                             StandardDeviationGravityAccelerometerY = mean(StandardDeviationGravityAccelerometerY, na.rm = TRUE),
                             StandardDeviationGravityAccelerometerZ = mean(StandardDeviationGravityAccelerometerZ, na.rm = TRUE),                 
                             MeanBodyAccelerometerJerkX = mean(MeanBodyAccelerometerJerkX, na.rm = TRUE),
                             MeanBodyAccelerometerJerkY = mean(MeanBodyAccelerometerJerkY, na.rm = TRUE),                             
                             MeanBodyAccelerometerJerkZ = mean(MeanBodyAccelerometerJerkZ, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerJerkX = mean(StandardDeviationBodyAccelerometerJerkX, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerJerkY = mean(StandardDeviationBodyAccelerometerJerkY, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerJerkZ = mean(StandardDeviationBodyAccelerometerJerkZ, na.rm = TRUE),                
                             MeanBodyGyrometerX = mean(MeanBodyGyrometerX, na.rm = TRUE),
                             MeanBodyGyrometerY = mean(MeanBodyGyrometerY, na.rm = TRUE),
                             MeanBodyGyrometerZ = mean(MeanBodyGyrometerZ, na.rm = TRUE), 
                             StandardDeviationBodyGyrometerX = mean(StandardDeviationBodyGyrometerX, na.rm = TRUE),                       
                             StandardDeviationBodyGyrometerY = mean(StandardDeviationBodyGyrometerY, na.rm = TRUE),
                             StandardDeviationBodyGyrometerZ = mean(StandardDeviationBodyGyrometerZ, na.rm = TRUE),
                             MeanBodyGyrometerJerkX = mean(MeanBodyGyrometerJerkX, na.rm = TRUE),
                             MeanBodyGyrometerJerkY = mean(MeanBodyGyrometerJerkY, na.rm = TRUE),
                             MeanBodyGyrometerJerkZ = mean(MeanBodyGyrometerJerkZ, na.rm = TRUE),
                             StandardDeviationBodyGyrometerJerkX = mean(StandardDeviationBodyGyrometerJerkX, na.rm = TRUE),                  
                             StandardDeviationBodyGyrometerJerkY = mean(StandardDeviationBodyGyrometerJerkY, na.rm = TRUE),
                             StandardDeviationBodyGyrometerJerkZ = mean(StandardDeviationBodyGyrometerJerkZ, na.rm = TRUE),                    
                             MeanBodyAccelerometerMagnitude = mean(MeanBodyAccelerometerMagnitude, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerMagnitude = mean(StandardDeviationBodyAccelerometerMagnitude, na.rm = TRUE),          
                             MeanGravityAccelerometerMagnitude = mean(MeanGravityAccelerometerMagnitude, na.rm = TRUE),
                             StandardDeviationGravityAccelerometerMagnitude = mean(StandardDeviationGravityAccelerometerMagnitude, na.rm = TRUE),        
                             MeanBodyAccelerometerJerkMagnitude = mean(MeanBodyAccelerometerJerkMagnitude, na.rm = TRUE),
                             StandardDeviationBodyAccelerometerJerkMagnitude = mean(StandardDeviationBodyAccelerometerJerkMagnitude, na.rm = TRUE),       
                             MeanBodyGyrometerMagnitude = mean(MeanBodyGyrometerMagnitude, na.rm = TRUE),  
                             StandardDeviationBodyGyrometerMagnitude = mean(StandardDeviationBodyGyrometerMagnitude, na.rm = TRUE),              
                             MeanBodyGyrometerJerkMagnitude = mean(MeanBodyGyrometerJerkMagnitude, na.rm = TRUE),
                             StandardDeviationBodyGyrometerJerkMagnitude = mean(StandardDeviationBodyGyrometerJerkMagnitude, na.rm = TRUE),             
                             MeanFourierBodyAcceleratorX = mean(MeanFourierBodyAcceleratorX, na.rm = TRUE),       
                             MeanFourierBodyAcceleratorY = mean(MeanFourierBodyAcceleratorY, na.rm = TRUE),                             
                             MeanFourierBodyAcceleratorZ = mean(MeanFourierBodyAcceleratorZ, na.rm = TRUE),
                             StandardDeviationFourierBodyAcceleratorX = mean(StandardDeviationFourierBodyAcceleratorX, na.rm = TRUE),                
                             StandardDeviationFourierBodyAcceleratorY = mean(StandardDeviationFourierBodyAcceleratorY, na.rm = TRUE),   
                             StandardDeviationFourierBodyAcceleratorZ = mean(StandardDeviationFourierBodyAcceleratorZ, na.rm = TRUE),                
                             MeanFourierBodyAcceleratorJerkX = mean(MeanFourierBodyAcceleratorJerkX, na.rm = TRUE),  
                             MeanFourierBodyAcceleratorJerkY = mean(MeanFourierBodyAcceleratorJerkY, na.rm = TRUE),                        
                             MeanFourierBodyAcceleratorJerkZ = mean(MeanFourierBodyAcceleratorJerkZ, na.rm = TRUE),
                             StandardDeviationFourierBodyAcceleratorJerkX = mean(StandardDeviationFourierBodyAcceleratorJerkX, na.rm = TRUE),            
                             StandardDeviationFourierBodyAcceleratorJerkY = mean(StandardDeviationFourierBodyAcceleratorJerkY, na.rm = TRUE), 
                             StandardDeviationFourierBodyAcceleratorJerkZ = mean(StandardDeviationFourierBodyAcceleratorJerkZ, na.rm = TRUE),            
                             MeanFourierBodyGyrometerX = mean(MeanFourierBodyGyrometerX, na.rm = TRUE),   
                             MeanFourierBodyGyrometerY = mean(MeanFourierBodyGyrometerY, na.rm = TRUE),                             
                             MeanFourierBodyGyrometerZ = mean(MeanFourierBodyGyrometerZ, na.rm = TRUE), 
                             StandardDeviationFourierBodyGyrometerX = mean(StandardDeviationFourierBodyGyrometerX, na.rm = TRUE),                
                             StandardDeviationFourierBodyGyrometerY = mean(StandardDeviationFourierBodyGyrometerY, na.rm = TRUE), 
                             StandardDeviationFourierBodyGyrometerZ = mean(StandardDeviationFourierBodyGyrometerZ, na.rm = TRUE),                  
                             MeanFourierBodyAcceleratorMagnitude = mean(MeanFourierBodyAcceleratorMagnitude, na.rm = TRUE),
                             StandardDeviationFourierBodyAcceleratorMagnitude = mean(StandardDeviationFourierBodyAcceleratorMagnitude, na.rm = TRUE),        
                             MeanFourierBodyBodyAcceleratorJerkMagnitude = mean(MeanFourierBodyBodyAcceleratorJerkMagnitude, na.rm = TRUE),
                             StandardDeviationFourierBodyBodyAccleratorJerkMagnitude = mean(StandardDeviationFourierBodyBodyAccleratorJerkMagnitude, na.rm = TRUE), 
                             MeanFourierBodyBodyGyrometerMagnitude = mean(MeanFourierBodyBodyGyrometerMagnitude, na.rm = TRUE),    
                             StandardDeviationFourierBodyBodyGyrometerMagnitude = mean(StandardDeviationFourierBodyBodyGyrometerMagnitude, na.rm = TRUE),     
                             MeanFourierBodyBodyGyrometerJerkMagnitude = mean(MeanFourierBodyBodyGyrometerJerkMagnitude, na.rm = TRUE), 
                             StandardDeviationFourierBodyBodyGyrometerJerkMagnitude = mean(StandardDeviationFourierBodyBodyGyrometerJerkMagnitude, na.rm = TRUE)  )

final_summarized_data <- data.frame(summarized_data)
final_summarized_data