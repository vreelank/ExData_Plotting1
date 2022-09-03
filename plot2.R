#read data and select data from wanted dates and times
fileName <- "household_power_consumption.txt"
fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

#creates a date and time variable in the POSIXlt and POSIXt class
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#creates a line plot of datetime against Global Active Power
png("plot2.png", width = 480, height = 480)
plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()