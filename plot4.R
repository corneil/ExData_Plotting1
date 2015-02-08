source('download-extract.R')
if(!require(lattice)) {
    install.packages("lattice")
    library(lattice)
}
datetime <- house$datetime
Global_active_power <- house$Global_active_power
Voltage <- house$Voltage
Global_reactive_power <- house$Global_reactive_power
Sub_metering_1 <- house$Sub_metering_1
Sub_metering_2 <- house$Sub_metering_2
Sub_metering_3 <- house$Sub_metering_3
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Graph 1
plot(datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
#Graph 2
plot(datetime, Voltage, type="l")
# Graph 3
legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lineData <- c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
metering <- range(lineData)
colors <- c("black", "red", "blue")
plot(x = house$datetime, y=NULL, col=colors[3], ylim = metering, type="l", ylab = "", xlab = "", axes = FALSE, frame.plot = TRUE)
lines(Sub_metering_1, type="l", col=colors[1])
lines(Sub_metering_2, type="l", col=colors[2])
lines(Sub_metering_3, type="l", col=colors[3])
axis.Date(side = 1, house$datetime, format = "%a")
axis(side = 2, house$Sub_metering_3)
legend("topright", legendNames, col = c("black", "red", "blue"), lty = c(1,1), box.lty = c(0,0))
#Graph 4
plot(datetime, Global_reactive_power, type="l")
dev.off()
