setwd("D:/Coursera/Exploratory Data Analysis/Week 1 Assignment")

require(data.table)
require(lubridate)

#Only use dates from 1st and 2nd, February 2007
data <- fread("data/household_power_consumption.txt", header=TRUE, sep=";")
date1<-dmy("1/2/2007")
date2<-dmy("2/2/2007")
data$Date<-dmy(data$Date)
data2<-data[data$Date==date1|data$Date==date2]

png("plot1.png", width=480, height=480)
hist(as.numeric(data2$Global_active_power), col="red", ylim=c(0,1200),
     main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()