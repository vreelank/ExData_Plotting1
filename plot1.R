#read data and select data from wanted times
fileName <- "household_power_consumption.txt"
fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

#create histogram plot for Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()