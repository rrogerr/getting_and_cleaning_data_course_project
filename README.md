# getting_and_cleaning_data_course_project

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






