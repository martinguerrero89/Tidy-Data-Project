library(plyr)

XY= function(t){
        
        Dire= paste("./UCI HAR Dataset", t, sep="/")        
                Xt= paste("X_", t, ".txt", sep="")        
                XXt= paste(Dire, Xt, sep="/")  

                Yt= paste("y_", t, ".txt", sep="")
                YYt= paste(Dire, Yt, sep="/")

                St= paste("subject_", t, ".txt", sep="")
                SSt= paste(Dire, St, sep="/")

        Xtxt= read.table(XXt)
        Ytxt= read.table(YYt)
        Stxt= read.table(SSt)

        features= read.table("./UCI HAR Dataset/features.txt", row.names=1)
        colnames(Xtxt)=features$V2
        colnames(Ytxt)= "activity"
        colnames(Stxt)= "subject"

        Xmean= grep("mean()\\b", colnames(Xtxt))
        Xstd= grep("std()\\b", colnames(Xtxt))

        XT= c(Xmean,Xstd)
        XTsort= sort(XT)

        XTfinal= Xtxt[,XTsort]
        XYTfinal= cbind(Stxt,Ytxt, XTfinal)


        eval(parse(text=paste(t,"<<- XYTfinal")))
}

XY("train")
XY("test")

XYTT= rbind(train,test)

activity= read.table(paste("./UCI HAR Dataset","activity_labels.txt", sep="/"))
XYTT$activity= as.factor(XYTT$activity)

for(i in 1:length(activity$V2)){
        f=as.character(activity[i,1])
        t=as.character(activity[i,2])
        XYTT$activity= mapvalues(as.character(XYTT$activity), from = f, to = t)
        }
FINXY= XYTT[,-c(1,2)]

TIDY= aggregate(FINXY, list(Subject=XYTT$subject, Activity=XYTT$activity), FUN=mean)

write.table(TIDY, "tidydataset.txt",row.name=FALSE) 
