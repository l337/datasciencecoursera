# 1) Merge the training and the test sets to create one data set.
# 2) Extract only the measurements on the mean and standard deviation for each measurement. 
# 3) Use descriptive activity names to name the activities in the data set
# 4) Appropriately label the data set with descriptive activity names. 
# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

features <- read.table('./data/UCI HAR Dataset/features.txt')
activityType <- read.table('./data/UCI HAR Dataset/activity_labels.txt')
subjectTrain <- read.table('./data/UCI HAR Dataset/train/subject_train.txt')
x_train <- read.table('./data/UCI HAR Dataset/train/x_train.txt')
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')

# Assigin column names to the data imported above
colnames(activityType) <- c('activityId','activityType');
colnames(subjectTrain) <- "subjectId";
colnames(x_train) <- features[,2]; 
colnames(y_train) <- "activityId";