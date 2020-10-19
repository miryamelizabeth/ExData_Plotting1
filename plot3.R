data <- read.table("./data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings="?")

data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

newdata <- subset(data, (dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))


png("plot3.png", width=480, height=480)


plot(x = newdata$dateTime,
     y = newdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = newdata$dateTime,
      y = newdata$Sub_metering_2,
      col = "red")

lines(x = newdata$dateTime,
      y = newdata$Sub_metering_3,
      col = "blue")

legend("topright",
       col = c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty = c(1,1),
       lwd = c(1,1))

dev.off()
