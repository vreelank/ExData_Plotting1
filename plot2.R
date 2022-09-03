fileName <- "household_power_consumption.txt"
fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()