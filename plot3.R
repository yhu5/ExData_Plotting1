##read data
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors=F)

##subsetting data
power.subset <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

##change date format
x <- paste(power.subset$Date,power.subset$Time)
power.subset$DateTime <- strptime(x,"%d/%m/%Y %H:%M:%S")

##plotting
png(file="plot3.png",width = 480, height = 480, units = 'px')
library(datasets)
with(power.subset,plot(DateTime,Sub_metering_1,type="l",ylim=c(0,38),
                       xlab="",ylab="Energy sub metering"))
with(power.subset,lines(DateTime,Sub_metering_2,col="red"))
with(power.subset,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
         "Sub_metering_2","Sub_metering_3"))
dev.off()
