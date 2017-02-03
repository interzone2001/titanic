require(xlsx)
# read file
data <- read.xlsx2("titanic_original.xls",1,stringsAsFactors=FALSE)
data$embarked <- sub("^$", "S", data$embarked)  #substitute S for blanks
data$age<-as.numeric(data$age) #convert to numeric
agemean<-mean(data$age,na.rm=TRUE) #compute mean of age in preparation to populate missing values
data$age[is.na(data$age)] <- agemean #replace NAs with mean
data$boat<-sub("^$","None",data$boat) #substitute None for blanks
data$has_cabin_number<-ifelse(data$cabin=="",0,1)
write.csv(data,file="titanic_clean.csv",row.names = FALSE)