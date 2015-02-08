# Plot3: Creating Multiline plot with legends and different colors
# Note: To show labels in English its needed to change the locale to English 
# in non English locale computers.
Sys.setlocale("LC_TIME", "English")
fileName <- "household_power_consumption.txt"
rawdata  <- read.table(fileName, header=TRUE, sep=";", nrows=5)
classes  <- sapply(data, class)
rawdata  <- read.table(fileName, header=TRUE, sep=";", na.strings="?", colClasses=classes)
data     <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
data     <- na.omit(data)
data$DateTime <- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Actual plot considering different font sizes to mimic the examples
png(file = "plot3.png", width=480, height=480, units="px")
plot(data$DateTime, data$Sub_metering_1, type="n", 
        ylab="Energy Sub metering", cex.lab=0.8, xlab="", cex.axis=0.8)
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red","blue"), cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

