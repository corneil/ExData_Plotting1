source('download-extract.R')
png("plot2.png", width = 480, height = 480)
plot(house$datetime, house$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
