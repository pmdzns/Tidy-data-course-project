readme.md

Script name:  "run_analysis.R"

Use:    data.frame <- run_analysis()

Files:   located in ./data 

 'features.txt': List of all features.

 'activity_labels.txt': Links the class labels with their activity name.

Files located in ./data/train

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

Files located in ./data/test

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


Best method for importing txt file:

tidy_data<- read.table(file = "tidy_data.txt",sep = " ", header = TRUE, stringsAsFactors = FALSE)


