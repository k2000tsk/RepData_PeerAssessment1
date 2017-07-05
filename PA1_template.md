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








