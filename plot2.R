# Plot2: 
# Note: To show labels in English I need to change my own Rstudio locale 
Sys.setlocale("LC_TIME", "English")
fileName <- "household_power_consumption.txt"
rawdata  <- read.table(fileName, header=TRUE, sep=";", nrows=5)
classes  <- sapply(data, class)
rawdata  <- read.table(fileName, header=TRUE, sep=";", na.strings="?", colClasses=classes)
data     <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
data     <- na.omit(data)
data$DateTime <- strptime( paste (data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Global_active_power, type="l", 
        ylab="Global Active Power (kilowatts)", cex.lab=0.7, xlab="", cex.axis=0.8)
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

