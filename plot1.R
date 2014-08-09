##setwd("D:/Coursera/EDA/Project1")

##read data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

##subsetting data
power.subset <- subset(power, Date%in%"1/2/2007"|Date%in%"2/2/2007")

##change date format
x <- paste(power.subset$Date,power.subset$Time)
power.subset$DateTime <- strptime(x,"%m/%d/%Y %H:%M:%S")

##plotting the histogram
png(file="plot1.png",width = 480, height = 480, units = 'px')
library(datasets)
hist(power.subset$Global_active_power, col="red", main="Global Active Power",
     xlim = c(0,6), ylim = c(0,1200), xlab="Global Active Power (Kilowatts)")
dev.off()
