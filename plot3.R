#read data and select data from wanted dates and times
fileName <- "household_power_consumption.txt"
fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

#creates a date and time variable in the POSIXlt and POSIXt class
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#creates a png with a plot of time against the sub_metering 1, 2, and 3 and a legend
png("plot3.png", width = 480, height = 480)
plot(datetime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()