setwd("/home/rogelio/Desktop/datasciencecoursera/Getting_and_Cleaning_Data_project/UCI HAR Dataset")

######################### IMPORT TRAIN DATA ##########################

subject_label <- read.table("./train/subject_train.txt")
activity_identifier <- read.table("./train/y_train.txt")
x_train <- read.table("./train/X_train.txt")

str_x <- "./train/Inertial Signals/body_acc_x_train.txt"
str_y <- "./train/Inertial Signals/body_acc_y_train.txt"
str_z <- "./train/Inertial Signals/body_acc_z_train.txt"

body_acc_x <- read.table(str_x)
body_acc_y <- read.table(str_y)
body_acc_z <- read.table(str_z)

modif_str_x <- gsub("acc", "gyro", str_x)
modif_str_y <- gsub("acc", "gyro", str_y)
modif_str_z <- gsub("acc", "gyro", str_z)

body_gyro_x <- read.table(modif_str_x)
body_gyro_y <- read.table(modif_str_y)
body_gyro_z <- read.table(modif_str_z)

modif_str_x <- gsub("body", "total", str_x)
modif_str_y <- gsub("body", "total", str_y)
modif_str_z <- gsub("body", "total", str_z)

total_x <- read.table(modif_str_x)
total_y <- read.table(modif_str_y)
total_z <- read.table(modif_str_z)

######################### IMPORT TEST DATA ###########################

subject_label1 <- read.table("./test/subject_test.txt")
activity_identifier1 <- read.table("./test/y_test.txt")
x_train1 <- read.table("./test/X_test.txt")

str_x1 <- "./test/Inertial Signals/body_acc_x_test.txt"
str_y1 <- "./test/Inertial Signals/body_acc_y_test.txt"
str_z1 <- "./test/Inertial Signals/body_acc_z_test.txt"

body_acc_x1 <- read.table(str_x1)
body_acc_y1 <- read.table(str_y1)
body_acc_z1 <- read.table(str_z1)

modif_str_x1 <- gsub("acc", "gyro", str_x1)
modif_str_y1 <- gsub("acc", "gyro", str_y1)
modif_str_z1 <- gsub("acc", "gyro", str_z1)

body_gyro_x1 <- read.table(modif_str_x1)
body_gyro_y1 <- read.table(modif_str_y1)
body_gyro_z1 <- read.table(modif_str_z1)

modif_str_x1 <- gsub("body", "total", str_x1)
modif_str_y1 <- gsub("body", "total", str_y1)
modif_str_z1 <- gsub("body", "total", str_z1)

total_x1 <- read.table(modif_str_x1)
total_y1 <- read.table(modif_str_y1)
total_z1 <- read.table(modif_str_z1)

######################## VARIABLE LABELS #############################

data_names <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

######################################################################

######################## TRAIN DATASET ###############################

# setting descriptive names for the column that contains the 
# subjects' labels
names(subject_label) <- c("subject_ID")

# descriptive activity names obtained from file "activity_labels.txt"
act_label <- activity_labels[unlist(activity_identifier),][[2]]
act_label <- as.data.frame(act_label)

# naming x_train data with the labels from features.txt
names(x_train) <- data_names[[2]]

# assembling train data frame
train_df <- data.frame(subject_label, act_label, x_train)

######################## TEST DATASET ################################

# setting descriptive names for the column that contains the 
# subjects' labels
names(subject_label1) <- c("subject_ID")

# descriptive activity names obtained from file "activity_labels.txt"
act_label <- activity_labels[unlist(activity_identifier1),][[2]]
act_label1 <- as.data.frame(act_label)

# naming x_train data with the labels from features.txt
names(x_train1) <- data_names[[2]]

# assembling test data frame
test_df <- data.frame(subject_label1, act_label1, x_train1)

######################## MERGE DATASETS ##############################

# merge train and test datasets
total_df <- merge(train_df, test_df, all = TRUE)

################# EXTRACT STD AND MEAN MEASUREMENTS ##################

mean_std <- total_df[ , grepl("mean|std|subject_ID|act_label", names(total_df))]

################### MEAN BY SUBJECT AND ACTIVITY #####################

means_agg <- aggregate(. ~ subject_ID + act_label, data = mean_std, FUN= "mean" )

# means_ag data frame is sorted by activity, the following sorts it
# by subject_ID
means_agg_by_subject <- means_agg[order(means_agg$subject_ID),]

write.table(means_agg_by_subject, "./means_aggregate.txt", row.names = FALSE)