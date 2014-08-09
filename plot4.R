##read data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=F)

##subsetting data
power.subset <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

##change date format
x <- paste(power.subset$Date,power.subset$Time)
power.subset$DateTime <- strptime(x,"%d/%m/%Y %H:%M:%S")

##plotting
png(file="plot4.png",width = 500, height = 500, units = 'px')
##png(file="plot4.png")
library(datasets)
par(mfrow=c(2,2))
with(power.subset,{
     plot(DateTime,Global_active_power,type="l",ylim=c(0,7.5), xlab="",
                       ylab="Global Active Power(kilowatts)")
     plot(DateTime, Voltage,type="l",xlab="datetime",ylab="Voltage")
     plot(DateTime,Sub_metering_1,type="l",ylim=c(0,38),
          xlab="",ylab="Energy sub metering")
     lines(DateTime,Sub_metering_2,col="red")
     lines(DateTime,Sub_metering_3,col="blue")
     legend("topright",lty=1,col=c("black","red","blue"),
     legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
     plot(DateTime, Global_reactive_power,type="l",ylim=c(0,0.5),xlab="datetime")
    })
dev.off()
