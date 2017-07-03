setwd("D:/1-1. R studio/lecture5. reproducible research/week2")
activity<-read.csv(file="activity.csv",na.strings="NA")
activity$date<-as.Date(activity$date)

total_steps_per_day<-aggregate(steps~date,activity,sum,na.rm=TRUE)
hist(total_steps_per_day$steps,xlab="Total steps",ylab="Frequency",main="Total steps per day")

mean_steps<-mean(total_steps_per_day$steps,na.rm=TRUE)
median_steps<-median(total_steps_per_day$steps,na.rm=TRUE)

# Mean number of steps taken each day
mean_steps

# Median number of steps taken each day
median_steps

mean_steps_per_day<-aggregate(steps~interval,activity,mean)
plot(mean_steps_per_day$interval,mean_steps_per_day$steps,type="l",
     main="Mean steps per day",xlab="Interval",ylab="Average steps")
     
max_interval<-aggregate(steps~interval,activity,sum,na.rm=TRUE)
max_interval[which.max(max_interval$steps),1]

sum(is.na(activity$steps))

after_activity<-na.omit(activity)
total_steps_except_NA<-aggregate(steps~date,after_activity,sum,na.rm=TRUE)
hist(total_steps_except_NA$steps,xlab="Total steps",main="Total steps per day")

days<-1:nrow(activity)
state<-1:nrow(activity)
days_activity<-cbind(activity,days,state)
days_activity$days<-weekdays(days_activity$date)

# I can't change the language, so I use korean language in this question
days_activity[days_activity$days=="월요일",]$state<-"weekday"
days_activity[days_activity$days=="화요일",]$state<-"weekday"
days_activity[days_activity$days=="수요일",]$state<-"weekday"
days_activity[days_activity$days=="목요일",]$state<-"weekday"
days_activity[days_activity$days=="금요일",]$state<-"weekday"
days_activity[days_activity$days=="토요일",]$state<-"weekend"
days_activity[days_activity$days=="일요일",]$state<-"weekend"

weekday_activity<-subset(days_activity,state=="weekday")
weekend_activity<-subset(days_activity,state=="weekend")

weekday<-aggregate(steps~interval,weekday_activity,mean)
plot(weekday$interval,weekday$steps,type="l",
     main="Mean steps per day on weekday",xlab="Interval",ylab="Average steps")
weekend<-aggregate(steps~interval,weekend_activity,mean)
plot(weekend$interval,weekend$steps,type="l",
     main="Mean steps per day on weekend",xlab="Interval",ylab="Average steps")
