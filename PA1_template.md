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






