run_analysis <- function(){

       ## read raw data ##

       X_test <- read.table("./Data/test/X_test.txt") 

       y_test <- read.table("./Data/test/y_test.txt")

       subject_test <- read.table("./data/test/subject_test.txt")

       X_train <- read.table("./Data/train/X_train.txt")

       y_train <- read.table("./Data/train/y_train.txt")

       subject_train <- read.table("./data/train/subject_train.txt")

       activity_labels <- read.table("./Data/activity_labels.txt")

       ## read measurment label list ##

       features <- read.table("./data/features.txt",sep=" ")

       activitylist <- as.character(activity_labels[,2])

       for (j in 1:6){y_test[y_test==j] <- activitylist[[j]]}      
       for (j in 1:6){y_train[y_train==j] <- activitylist[[j]]}

       ## Build data frames and add column names

       names(X_test) <- features[,2]
       X_test <- cbind(subject_test,y_test,X_test)
       names(X_test) [1] <- "subject_id"
       names(X_test) [2] <- "activity_id"

       names(X_train) <- features[,2]
       X_train <- cbind(subject_train,y_train,X_train)
       names(X_train) [1] <- "subject_id"
       names(X_train) [2] <- "activity_id"


       ## Merge Test & Training Data ##

       alldata <- rbind(X_test,X_train)
     

       ## Extract mean & standard deviation metrics for each measurment ##

       meandata <- c("subject_id","activity_id",grep("mean()",features$V2,value=TRUE))
       stddata <- grep("std()",features$V2,value=TRUE)
       mdata <- c(meandata,stddata)

       ## Add descriptive names

       measurementdata <- alldata[,mdata]       
       

       msd <- measurementdata[order("subject_id","activity_id"),]
       

      # Build tidy data table

       tidy_data <- NULL

       for ( n in 30:1){
     
       td5 <- NULL
       for ( i in 1:6) {           
            msd2 <- subset(measurementdata,subject_id == n & activity_id == activitylist[i] )
            td1 <- msd2[1,1:2]     
            td3 <- lapply(msd2[,3:(ncol(msd2))],mean)
            td4 <- cbind(td1,td3)
            td5 <- rbind(td5,td4)
            }

       tidy_data <- rbind(td5,tidy_data)
       }
       
       # clean up varable names
       names(tidy_data) <- gsub("_","",names(tidy_data))
       

       return(tidy_data)
}

     


