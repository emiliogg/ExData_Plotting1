# Plot1: Histogram Global ACtive Power
# (reduced scale of main and labels text to follow example)
fileName <- "household_power_consumption.txt"
rawdata  <- read.table(fileName, header=TRUE, sep=";", nrows=5)
classes  <- sapply(data, class)
rawdata  <- read.table(fileName, header=TRUE, sep=";", na.strings="?", colClasses=classes)
data     <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
data     <- na.omit(data)
data$Date<- as.Date(data$Date,"%d/%m/%Y")
data$Time<- strptime(data$Time, "%H:%M:%S")

hist(data$Global_active_power, col="red", cex.axis = 0.7,
    main="Global Active Power", cex.main= 0.9, 
    xlab="Global Active Power (kilowatts)", cex.lab = 0.8)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
