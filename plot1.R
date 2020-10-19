data <- read.table("./data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings="?")

data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

newdata <- subset(data, (dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))


png("plot1.png", width=480, height=480)


hist(x = newdata$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")

dev.off()