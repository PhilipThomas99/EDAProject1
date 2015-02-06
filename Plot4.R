#full dataset
data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting the data
dataSubset <- data[which(data$Date >= "2007-02-01" & data$Date<="2007-02-02"),]
row.names(dataSubset) <- NULL

#converting time
timeFormat <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Time <- strptime(timeFormat, format = "%Y-%m-%d %H:%M:%S")

#Plotting to png
png("plot4.png", width=480, height=480, bg = "transparent") 
par(mfrow=c(2,2)) #make by plots filled by row, 2 rows, 2 columns

#plot 1 (upper left)
plot(dataSubset$Time, dataSubset$Global_active_power, type='l',
     ylab="Global Active Power",xlab="")

#plot 2 (bottom left)
plot(dataSubset$Time, dataSubset$Voltage, type='l',
     ylab="Voltage",xlab="datetime")

#plot 3 (upper right)
plot(dataSubset$Time, dataSubset$Sub_metering_1, type='l',
     ylab="Energy sub metering",xlab="", col='black')
lines(dataSubset$Time, dataSubset$Sub_metering_2, col='red')
lines(dataSubset$Time, dataSubset$Sub_metering_3, col='blue')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty='n')

#plot 4 (bottom right)
plot(dataSubset$Time, dataSubset$Global_reactive_power, type='l',
     ylab="Global Active Power",xlab="datetime")

dev.off()
