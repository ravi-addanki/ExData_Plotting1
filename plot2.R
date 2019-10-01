#Read Data
source("getExData.R"); tidyData <- getExData()
#Set Parameters
par(fin = c(480/96,480/96))
#par(fin = c(4,4)) # plot area adjusted to meet requirement
par(mar=c(4,4,3,1))
par(mfrow = c(1,1))

#Construct graph on screen
plot(tidyData$Time,tidyData$Global_active_power,type="l",main="",xlab="",
                    ylab="Global Active Power (kilowatts)")

#Save to file as png
dev.copy(png,file="plot2.png")
dev.off()
