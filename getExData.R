getExData <- function (){
    if (!dir.exists("./data")) dir.create("./data")
    urlRef <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    if (!file.exists("./data/HouseHoldPowerConsumption.zip")) 
        download.file(urlRef,"./data/HouseHoldPowerConsumption.zip", method= "curl")
    
    
    ## Read data for 2007-02-01
    # Compute size
    dataSample <- read.csv("./data/household_power_consumption.txt",nrows  = 10,sep=";",header=FALSE)
    memReqdMbCrude <- as.numeric(object.size(dataSample) * 2075259 / 10 / 1000000)
    data1Rows <- read.csv( pipe('type data\\household_power_consumption.txt | find /C \"2/1/2007;\"'),sep=";",row.names = NULL,header=FALSE)
    data2Rows <- read.csv( pipe('type data\\household_power_consumption.txt | find /C \"2/2/2007;\"'),sep=";",row.names = NULL,header=FALSE)
    memReqdMbOptimum <- as.numeric(object.size(dataSample) * (as.numeric(data1Rows)+as.numeric(data2Rows)) / 10 / 1000000 ) 
    cat("Non-Optimized Memory Required is :",    memReqdMbCrude, " MB.  \n")
    cat("Optimized Memory Required is :",    memReqdMbOptimum, " MB. \n ")
    
    #Read Data for each date and combine it.
    colNames1 <- c("Date","Time","Global_active_power",
                   "Global_reactive_power","Voltage","Global_intensity",
                   "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    data1 <- read.csv( pipe('type data\\household_power_consumption.txt | find \"2/1/2007\"'),sep=";",
                       col.names=colNames1, header=FALSE)
    data2 <- read.csv( pipe('type data\\household_power_consumption.txt | find \"2/2/2007\"'),sep=";",
                       col.names=colNames1, header=FALSE)
    data1 <-rbind(data1,data2)
    
    #Realized that the find filter may bring other data
    data1 <- data1[data1$Date== "2/2/2007" |data1$Date== "2/1/2007", ]
    #Convert values into proper formats 
    #Date and time columns
    data2 <- data.frame("Date" =as.Date(data1$Date,format ="%m/%d/%Y"),"Time"= strptime( paste(data1$Date,data1$Time),format = "%m/%d/%Y %H:%M:%S"))
    #Other columns
    for ( i in 3:9) data2[,i] = as.numeric(data1[,i])
    colnames(data2) <- colNames1; data2
}
