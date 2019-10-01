#Read Data
source("getExData.R")
tidyData <- getExData()
#Set Parameters
par(fin = c(480/96,480/96))
par(fin = c(4,4)) # plot area adjusted to meet requirement
par(mar=c(4,4,3,1))

#Construct graph on screen
hist(tidyData$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",col="red")

#Save to file as png
dev.copy(png,file="plot1.png")
dev.off()