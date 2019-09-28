#Read Data
source("getExData.R"); tidyData <- getExData()
#Set Parameters
par(fin = c(480/96,480/96))
par(mar=c(4,4,3,1))
par(mfrow = c(2,2))

#Construct graph on screen
#Plot1
plot(tidyData$Time,tidyData$Global_active_power,type="l",main="",xlab="",
     ylab="Global Active Power")

#Plot2
plot(tidyData$Time,tidyData$Voltage,type="l",main="",xlab="datetime",
     ylab="Voltage")


#Plot3
plot(tidyData$Time,tidyData$Sub_metering_3 * 1.3 ,type="n",main="",xlab="",
                    ylab="Energy sub metering")
lines(tidyData$Time,tidyData$Sub_metering_1,col="black")
lines(tidyData$Time,tidyData$Sub_metering_2,col="red")
lines(tidyData$Time,tidyData$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),cex = 0.4,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       box.lty =  0,inset=0.01)

#Plot4
plot(tidyData$Time,tidyData$Global_reactive_power,type="l",main="",xlab="datetime",
     ylab="Global_reactive_power")

#Save to file as png
dev.copy(png,file="plot4.png")
dev.off()
