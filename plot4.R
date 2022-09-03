#read data and select data from wanted dates and times
fileName <- "household_power_consumption.txt"
fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

#creates a date and time variable in the POSIXlt and POSIXt class
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#set parameters for 4 plots arranged by column and create png
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#top-left plot of Global active power
plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#bottom-left plot of different energy sub meterings
plot(datetime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

#top-right plot of Voltage
plot(datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#bottom-right plot of Global reactive power
plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()