setwd("D:/Users/Emilio/Documents/GitProjects/datasciencecoursera/ExData_Plotting1")
fileName <- "household_power_consumption.txt"
rawdata  <- read.table(fileName, header=TRUE, sep=";", nrows=5)
classes  <- sapply(data, class)
rawdata  <- read.table(fileName, header=TRUE, sep=";", na.strings="?", colClasses=classes)
data     <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
data     <- na.omit(data)
data$Date<- as.Date(data$Date,"%d/%m/%Y")
data$Time<- strptime(data$Time, "%H:%M:%S")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)")
