#read all data sets
#setwd("user directory")
colnms = read.table('./UCI HAR Dataset/features.txt',sep='')
testdata = read.table('./UCI HAR Dataset/test/X_test.txt',sep='',col.names = colnms$V2)
testact = read.table('./UCI HAR Dataset/test/y_test.txt')
testsubj = read.table('./UCI HAR Dataset/test/subject_test.txt')
traindata = read.table('./UCI HAR Dataset/train/X_train.txt',sep='',col.names = colnms$V2)
trainact = read.table('./UCI HAR Dataset/train/y_train.txt')
trainsubj = read.table('./UCI HAR Dataset/train/subject_train.txt')




#create keep vector 
keep = c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:350,373:375,424:429,452:454,503,504,513,516,517,526,529,530,539,542,543,552,555:561)

testdata=testdata[keep]
traindata=traindata[keep]
collabels = colnms$V2[keep]

#combine subject and activity data

testdata$subject = testsubj$V1
testdata$activity = testact$V1

traindata$subject = trainsubj$V1
traindata$activity= trainact$V1


#combine training and test data sets then sort
combdata=merge(traindata,testdata,all = T)
tidydata <- combdata[order(combdata$subject,combdata$activity),]


#create descriptive names for activity list
actdesc = c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
descvector = NULL
for (indx in 1:nrow(tidydata)){descvector=c(descvector,actdesc[tidydata$activity[indx]])}
tidydata$actdescription = descvector
matfords = matrix(data=NA,nrow = 180,ncol = 89)
rowindx = 0;colindx=0

#create a new tidy data set calculating the mean of every measurement for every participant
    
for (aindx in 1:6){
  actenty = actdesc[aindx]
  
  for (sindx in 1:30){
    
    tidss = subset(tidydata,tidydata$activity==aindx & tidydata$subject==sindx)
    for (vindx in 1:86){
      meanvector = c(meanvector,mean(tidss[,vindx]))
    }
    rowindx=rowindx+1
    colindx=colindx+1
    matfords[rowindx,colindx]=aindx
    colindx=colindx+1
    matfords[rowindx,colindx]=actenty
    colindx=colindx+1
    matfords[rowindx,colindx]=sindx
    colindx=colindx+1
    for (meancnt in 1:86){
      matfords[rowindx,colindx]=meanvector[meancnt]
      colindx=colindx+1
    }
    colindx=0
  }
}

newlabel = c('activity','act descr','subject',as.character(collabels))
tidymeandata = as.data.frame(matfords)
colnames(tidymeandata)=newlabel

#final submission dataset = tidymeandata
#write.table (tidymeandata,file="user file name",row.name = FALSE)
