# getting_and_cleaning_data_course_project

## General

The script "run_analysis.R" contained in this repo transforms into a tidy dataset the data from the following study:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The output of the script is composed by four data frames:

* total_df
* mean_std
* means_ag
* means_ag_by_subject

See explanations below.

In the aforementioned study, human subjects performed different physical activities carrying a smartphone. The quantities contained in these datasets are the raw and processed measurements of the smartphones' accelerometers.

The raw data set obtained was randomly partitioned into two groups:
* train: composed by 70% of subjects
* test: composed by 30% of subjects

The four data frames produced by our script are an attempt to summarize and merge the two aforementioned data sets.

The two first columns are common to our four data sets:
* subject_ID: Identifies with a number from 1 to 30 the subject/volunteer who performed the activity whose measurements are recorded in the same row.
* act_label: Identifies with a literal label the type of activity that the subject was performing when the measurements were made. Levels: WALKING, WALKING_UPSATAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

What follows is an explanation of the specifics of each output data frame.

##total_df

It's the result of merging the train and test datasets. Hence, it contains data from all of the subjects.

Each row is a 563 variables observation, the first two variables being the subject_ID and the act_label. 

The names of the rest of the variables begin with one of the following prefixes:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

where:
* "t" indicates that it's a time domain variable and "f" indicates it's a frequency domain variable.
* "body" indicates translational acceleration (in units of g) and "gyro" indicates angular speed (radians/second). Note: there are exceptions of variables with the "body" or "gyro" infixes that have different units from the mentioned before.
* "Jerk" indicates the derivative of acceleration (units of g per second).
* "Gravity" indicates the gravity signal that was separated from the "body" acceleration using a low-pass filter.
* X, Y or Z indicates the axis of the phone along which the measurements were made.

The aformentioned variable names end with one of the following suffixes:
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

NOTE: When running the script, the "()" are systematically replaced by ".." for formatting reasons.

Examples: 
* fBodyAccMag-kurtosis() refers to the kurtosis of the FFT of the magnitude of the body acceleration. Since Kurtosis is calculated using standarized forms of the distribution, this variable is unitless. The same thing happens with the skewness() variables.
* tBodyAccMag-energy() has units of the square of body acceleration.

## mean_std

It's composed only by columns from total_df that contain mean or standard deviation calculations of any magnitude in any domain.

Examples:
* fBodyAccMag-kurtosis() and tBodyAccMag.energy() columns are ___not___ contained in mean_std
* tBodyGyro-mean()-Z and fBodyGyro-std()-X are contained in mean_std

## means_agg

It's contains the means of each variable by subject and by activity. 

IMPORTANT: Though the variable names are the same as those of total_df, in means_agg the variables represent means.

## means_agg_by_subject

means_agg has its data sorted by act_label, while means_agg_by_subject has its data sorted by subject_ID.





