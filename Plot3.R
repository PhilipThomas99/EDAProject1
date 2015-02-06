#full dataset
data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting the data
dataSubset <- data[which(data$Date >= "2007-02-01" & data$Date<="2007-02-02"),]
row.names(dataSubset) <- NULL

#converting time
timeFormat <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Time <- strptime(timeFormat, format = "%Y-%m-%d %H:%M:%S")

#Plot to PNG device directly. 
png("plot3.png", width=480, height=480, bg = "transparent")
plot(dataSubset$Time, dataSubset$Sub_metering_1, type='l', # sub metering 1 line plot
     ylab="Energy sub metering",xlab="", col='black')
lines(dataSubset$Time, dataSubset$Sub_metering_2, col='red') # sub metering 2 line plot 
lines(dataSubset$Time, dataSubset$Sub_metering_3, col='blue')# sub metering 3 line plot
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1) # add legend
dev.off()

