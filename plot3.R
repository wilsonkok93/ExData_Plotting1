setwd("D:/Coursera/Exploratory Data Analysis/Week 1 Assignment")

require(data.table)
require(lubridate)

#Only use dates from 1st and 2nd, February 2007
data <- fread("data/household_power_consumption.txt", header=TRUE, sep=";")
date1<-dmy("1/2/2007")
date2<-dmy("2/2/2007")
data$Date<-dmy(data$Date)
data2<-data[data$Date==date1|data$Date==date2]
data2$datetime<-as.POSIXct(paste0(data2$Date, " ", data2$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(data2$datetime,data2$Sub_metering_1, type="l",
     ylab="Energy sub metering ", xlab="")
lines(data2$datetime,data2$Sub_metering_2, type="l", col="red")
lines(data2$datetime,data2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
