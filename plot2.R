##setwd("D:/Coursera/EDA/Project1")

##read data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=F)

##subsetting data
power.subset <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

##change date format
x <- paste(power.subset$Date,power.subset$Time)
power.subset$DateTime <- strptime(x,"%d/%m/%Y %H:%M:%S")

##plotting
png(file="plot2.png",width = 480, height = 480, units = 'px')
library(datasets)
with(power.subset,plot(DateTime,Global_active_power,type="l",ylim=c(0,7.5), xlab="",
     ylab="Global Active Power(kilowatts)"))
dev.off()
