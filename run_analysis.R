### STEP 0. Convert files in R objects

# read train/test data
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header=F, sep="")
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", header=F, sep="")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", header=F, sep="")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", header=F, sep="")
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", header=F, sep="")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", header=F, sep="")

# read info files
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, quote="\"")
features <- read.table("~/UCI HAR Dataset/features.txt", stringsAsFactors=FALSE, quote="\"")

### STEP 1. Merge the objets

# join the data.frames  
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
complete_data <- rbind(test,train)

### STEP 2. Clarifying 

# improve the column names
names(complete_data)[1] <- "Subject"
names(complete_data)[2] <- "Activity"
names(complete_data)[3:563] <- features[,2]

### STEP 3. Extract measurements 

# creates object with only the records that have mean&std. 
# include capital letters and meanFreq
mean_std <- complete_data[grep("mean|std|Subject|Activity",names(complete_data), ignore.case=T)]  

### STEP 4. Readibility. 

# transform the number-labels of Activity column in name-labels
for (i in 1:6){
      mean_std$Activity[mean_std$Activity == i] <- activity_labels[i,2]
}

# clean up and improve the features (columns 3:563)
# eliminate ()
clean <- as.list(gsub("\\(\\)","",colnames(mean_std)))
# eliminate (
clean <- as.list(gsub("\\("," ",clean))
# eliminate )
clean <- as.list(gsub("\\)","",clean))
# change ,g
clean <- as.list(gsub("\\,g","G",clean))
# change "-" by blank
clean <- as.list(gsub("\\-"," ",clean))
# capitalize the word mean
clean <- as.list(gsub("mean","Mean", clean))
# capitalize the word std
clean <- as.list(gsub("std","Std", clean))
# eliminate duplicate word "Body"
clean <- as.list(gsub("BodyBody", "Body", clean))
# apply the changes to the mean_std data frame
names(mean_std) <- as.character(clean)

## STEP 5. Creates a second data set 

# with the average of each variable for each activity and each subject
# creates a tidy data object
library(reshape2)
order_data <- melt(mean_std, id.vars = c("Subject", "Activity"))
tidy_data <- dcast(order_data, Subject + Activity ~ variable, mean)

# write txt and send outside R
write.table(tidy_data, "tidy_data.txt")