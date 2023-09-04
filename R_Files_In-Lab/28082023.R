#Import Libaray
library(tidyverse)

#Import Dataset
df2<-read.csv("C:/Users/saic3/CSE3046-F2-LAB_SLOT_L3+L4/In-Lab-Exercise-Dataset/Data.csv")
#Changing Types
#Since Class of TV_Size is char Convert to Int
View(df2)
df2$Tv.Size..Inches.=as.numeric(df2$Tv.Size..Inches.)


df2$OpSys=as.factor(df2$OpSys)
df2$OpSys<-as.numeric(df2$OpSys)
df2["OpSys"][df2["OpSys"]==1]<-NA


df2$DOB<-parse_date_time(df2$DOB,"dmy")
df2$DOB<-as.Date(df2$DOB)

#Question-1-Check For Null Values
sum(is.na(df2$Tv.Size..Inches.))
sum(is.na(df2$OpSys))
sum(is.na(df2$DOB))
sum(is.na(df2))

#Question-2:
df2<-df2 %>%
  fill(OpSys, .direction = 'up')
df2<-df2 %>%
  fill(Tv.Size..Inches., .direction = 'up')
df2<-df2 %>%
  fill(DOB, .direction = 'up')

#Question3:
df2$Tv.Size..Inches.<-df2$Tv.Size..Inches.*2.54
df2

#Create Age COlumn For DOB
df2<-df2%>%mutate(Age=Sys.Date()-DOB)
df2$Age<-as.integer(df2$Age)
df2$Age<-df2$Age/365
df2$Age<-round(df2$Age,0)
View(df2)

#
df2<-df2%>%mutate(Age2=Sys.Date()-DOB)
df2$Age2<-as.integer(df2$Age2)
df2$Age2<-df2$Age2/365
df2$Age2<-round(df2$Age2,0)
df2$Age<-df2%>%pull(Age)%>%cut(breaks =c(-Inf,1,13,18,65,Inf),labels = c("Infants","Children","Teenagers","Adults","Older Adults") )
