# PA1_template

#### Name : Taesoon Kim
#### Date : Jun-29-2017

## Assignment

#### Loading and preprocessing the data

1. Code for reading in the dataset and/or processing the data

```{r load}
setwd("D:/1-1. R studio/lecture5. reproducible research/week2")
activity<-read.csv(file="activity.csv",na.strings="NA")
activity$date<-as.Date(activity$date)
```

#### What is mean total number of steps taken per day?

2. Histogram of the total number of steps taken each day

```{r total steps}
total_steps_per_day<-aggregate(steps~date,activity,sum,na.rm=TRUE)
hist(total_steps_per_day$steps,xlab="Total steps",ylab="Frequency",main="Total steps per day")
```

3. Mean and median number of steps taken each day

```{r mean and median}
mean_steps<-mean(total_steps_per_day$steps,na.rm=TRUE)
median_steps<-median(total_steps_per_day$steps,na.rm=TRUE)

# Mean number of steps taken each day
mean_steps

# Median number of steps taken each day
median_steps
```

#### What is the average daily activity pattern?

4. Time series plot of the average number of steps taken

```{r time series plot}
mean_steps_per_day<-aggregate(steps~interval,activity,mean)
plot(mean_steps_per_day$interval,mean_steps_per_day$steps,type="l",
     main="Mean steps per day",xlab="Interval",ylab="Average steps")
```

5. The 5-minute interval that, on average, contains the maximum number of steps

```{r max number of steps}
max_interval<-aggregate(steps~interval,activity,sum,na.rm=TRUE)
max_interval[which.max(max_interval$steps),1]
```

#### Imputing missing values

6. Code to describe and show a strategy for imputing missing data

```{r counting missing data}
sum(is.na(activity$steps))
```

7. Histogram of the total number of steps taken each day after missing values are imputed

```{r histogram of total number of steps}
after_activity<-na.omit(activity)
total_steps_except_NA<-aggregate(steps~date,after_activity,sum,na.rm=TRUE)
hist(total_steps_except_NA$steps,xlab="Total steps",main="Total steps per day")
```

#### Are there differences in activity patterns between weekdays and weekends?

8. Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends

```{r plot weekdays and weekends}
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

```





