CODEBOOK
======================================================== 
for the Course Project "Getting and Cleaning Data" at Johns Hopkins Bloomberg School of Public Health 

## Original information

The original data was obtain from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip the UCI Machine Learning Repository.

The original description of the data can be found in  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data description
After the dowloading & unzip the data, the directory UCI HAR Dataset is created with the follow structure:
      
Files in the main directory
* activity_labels.txt
6 records. A description of human activity.
Id      numeric
* features
561 records
A list of the project parameters
* README.txt. 
A description of the project, additional comments and the team conducting the project
* features.info.txt
Technical details of the features (signals, vectors and variables used), as well as some changes made.

Two subdirectories, Test and Train with similar text files (only changes the records):
* subject_test    2947 records id volunteers
* X_test		2947 records 561 numerical measurements
* y_test		2947 records numerical id of activity

* subject_train	7352 records id volunteers
* X_train		7352 records 561 numerical measurements
* y_train		7352 records numerical id of activity

Notice that both subdirectories includes another subdirectory named Inertial Signals. This data was not used in this project.

## Data transformations: import, process, clean and creates dataset result.

The R script "run_analysis.R" performs the following:
      
0. Import to R the txt files listed above in the subdirectories and the files features.txt and activity_labels.txt

1. Merge files of the train and test subdirectories to create a single file named "complete_data"

2. Improve the data frame "complete_data" using the file features.txt and changing the names of the columns. In addition change the first and second columns names definition.

3. This step creates an object "mean_std" from "complete_data" with the identification volunteer (subject), identification label activity (Activity) and all measurements that contains means and standard desviations. That includes some differents mean features: Mean (first in capital letters) and meanFreq.

4. Improve the readibility and clean the last data frame "mean_std" in differents ways: eliminate punctuation marks, leave all the words to lower case except the first letter.
* using activity_labels.txt modify the Activity from a number to a more descriptive
* remove all the brackets "()"
* change the separate brackets "("or ")" to a blank
* change the dash "-" by a blank
* chang the expression ",g" to "G"
* capitalizes the word "mean" 
* capitalizes the word "std"
* eliminate duplicated words "Body"

These changes are applied to the column names of the object merged.
After the changes, the list of the variables are:
      |----------------------------------|
      | "1" "Subject"                 |
      | "2" "Activity"                   |
      | "3" "tBodyAcc Mean X"            |
      | "4" "tBodyAcc Mean Y"            |
      | "5" "tBodyAcc Mean Z"            |
      | "6" "tBodyAcc Std X"             |
      | "7" "tBodyAcc Std Y"             |
      | "8" "tBodyAcc Std Z"             |
      | "9" "tGravityAcc Mean X"         |
      | "10" "tGravityAcc Mean Y"        |
      | "11" "tGravityAcc Mean Z"        |
      | "12" "tGravityAcc Std X"         |
      | "13" "tGravityAcc Std Y"         |
      | "14" "tGravityAcc Std Z"         |
      | "15" "tBodyAccJerk Mean X"       |
      | "16" "tBodyAccJerk Mean Y"       |
      | "17" "tBodyAccJerk Mean Z"       |
      | "18" "tBodyAccJerk Std X"        |
      | "19" "tBodyAccJerk Std Y"        |
      | "20" "tBodyAccJerk Std Z"        |
      | "21" "tBodyGyro Mean X"          |
      | "22" "tBodyGyro Mean Y"          |
      | "23" "tBodyGyro Mean Z"          |
      | "24" "tBodyGyro Std X"           |
      | "25" "tBodyGyro Std Y"           |
      | "26" "tBodyGyro Std Z"           |
      | "27" "tBodyGyroJerk Mean X"      |
      | "28" "tBodyGyroJerk Mean Y"      |
      | "29" "tBodyGyroJerk Mean Z"      |
      | "30" "tBodyGyroJerk Std X"       |
      | "31" "tBodyGyroJerk Std Y"       |
      | "32" "tBodyGyroJerk Std Z"       |
      | "33" "tBodyAccMag Mean"          |
      | "34" "tBodyAccMag Std"           |
      | "35" "tGravityAccMag Mean"       |
      | "36" "tGravityAccMag Std"        |
      | "37" "tBodyAccJerkMag Mean"      |
      | "38" "tBodyAccJerkMag Std"       |
      | "39" "tBodyGyroMag Mean"         |
      | "40" "tBodyGyroMag Std"          |
      | "41" "tBodyGyroJerkMag Mean"     |
      | "42" "tBodyGyroJerkMag Std"      |
      | "43" "fBodyAcc Mean X"           |
      | "44" "fBodyAcc Mean Y"           |
      | "45" "fBodyAcc Mean Z"           |
      | "46" "fBodyAcc Std X"            |
      | "47" "fBodyAcc Std Y"            |
      | "48" "fBodyAcc Std Z"            |
      | "49" "fBodyAcc MeanFreq X"       |
      | "50" "fBodyAcc MeanFreq Y"       |
      | "51" "fBodyAcc MeanFreq Z"       |
      | "52" "fBodyAccJerk Mean X"       |
      | "53" "fBodyAccJerk Mean Y"       |
      | "54" "fBodyAccJerk Mean Z"       |
      | "55" "fBodyAccJerk Std X"        |
      | "56" "fBodyAccJerk Std Y"        |
      | "57" "fBodyAccJerk Std Z"        |
      | "58" "fBodyAccJerk MeanFreq X"   |
      | "59" "fBodyAccJerk MeanFreq Y"   |
      | "60" "fBodyAccJerk MeanFreq Z"   |
      | "61" "fBodyGyro Mean X"          |
      | "62" "fBodyGyro Mean Y"          |
      | "63" "fBodyGyro Mean Z"          |
      | "64" "fBodyGyro Std X"           |
      | "65" "fBodyGyro Std Y"           |
      | "66" "fBodyGyro Std Z"           |
      | "67" "fBodyGyro MeanFreq X"      |
      | "68" "fBodyGyro MeanFreq Y"      |
      | "69" "fBodyGyro MeanFreq Z"      |
      | "70" "fBodyAccMag Mean"          |
      | "71" "fBodyAccMag Std"           |
      | "72" "fBodyAccMag MeanFreq"      |
      | "73" "fBodyAccJerkMag Mean"      |
      | "74" "fBodyAccJerkMag Std"       |
      | "75" "fBodyAccJerkMag MeanFreq"  |
      | "76" "fBodyGyroMag Mean"         |
      | "77" "fBodyGyroMag Std"          |
      | "78" "fBodyGyroMag MeanFreq"     |
      | "79" "fBodyGyroJerkMag Mean"     |
      | "80" "fBodyGyroJerkMag Std"      |
      | "81" "fBodyGyroJerkMag MeanFreq" |
      
5. The last step is creates from "mean_std" a txt file that contains the measurements ordered and classiffied by subject and activity, and send to directory.

The original merged data frame (complete_data) is 10299 x 563 and now creates the final data frame (tidy_data) with 180 x 88. 
The rows are 30 subjects and 6 activities and the 88 columns are 1-2 for the subject and activity, and the other are measurements: mean, standard desviations, meanFrequencies etc...
