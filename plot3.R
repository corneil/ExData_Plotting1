source('download-extract.R')
if(!require(lattice)) {
    install.packages("lattice")
    library(lattice)
}
datetime <- house$datetime
Sub_metering_1 <- house$Sub_metering_1
Sub_metering_2 <- house$Sub_metering_2
Sub_metering_3 <- house$Sub_metering_3

legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lineData <- c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
metering <- range(lineData)
colors <- c("black", "red", "blue")
png("plot3.png", width = 480, height = 480)
plot(x = datetime, y=NULL, col=colors[3], ylim = metering, type="l", ylab = "Energy sub metering", xlab = "", axes = FALSE, frame.plot = TRUE)
lines(Sub_metering_1, type="l", col=colors[1])
lines(Sub_metering_2, type="l", col=colors[2])
lines(Sub_metering_3, type="l", col=colors[3])
# Can't figure out why the dates aren't displaying like on other graphs.
axis.Date(side = 1, datetime, format = "%a")
axis(side = 2, Sub_metering_3)
legend("topright", legendNames, col = c("black", "red", "blue"), lty = c(1,1))
dev.off()
