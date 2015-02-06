#full dataset
data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting the data
dataSubset <- data[which(data$Date >= "2007-02-01" & data$Date<="2007-02-02"),]
row.names(dataSubset) <- NULL

#converting time
timeFormat <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Time <- strptime(timeFormat, format = "%Y-%m-%d %H:%M:%S")

#Plotting
png("plot1.png", width=480, height=480, bg = "transparent") #device to png with transparent background (as original)
hist(dataSubset$Global_active_power, col='red',main = 'Global Active Power',
     xlab ='Global Active Power (kilowatts)', ylab='Frequency')
dev.off()
