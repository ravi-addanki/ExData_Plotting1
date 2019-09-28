#Read Data
source("getExData.R"); tidyData <- getExData()
#Set Parameters
par(fin = c(480/96,480/96))
par(mar=c(4,4,1,1))
par(mfrow = c(1,1))

#Construct graph on screen 
plot(tidyData$Time,tidyData$Sub_metering_3 * 1.3 ,type="n",main="",xlab="",
                    ylab="Energy sub metering")
lines(tidyData$Time,tidyData$Sub_metering_1,col="black")
lines(tidyData$Time,tidyData$Sub_metering_2,col="red")
lines(tidyData$Time,tidyData$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save to file as png
dev.copy(png,file="plot3.png")
dev.off()
