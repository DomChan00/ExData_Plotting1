file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))
sub$Date <- strptime(paste(sub$Date, sub$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2, 2))

plot(sub$Date, sub$Global_active_power, xlab = "", ylab="Global Active Power", type = "l")
plot(sub$Date, sub$Voltage, xlab = "datetime", ylab="Voltage", type = "l")

plot(sub$Date, sub$Sub_metering_1, col="black", type = "l", xlab = "", ylab="Energy sub metering")
points(sub$Date, sub$Sub_metering_2, col="red", type = "l")
points(sub$Date, sub$Sub_metering_3, col="blue", type = "l")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(sub$Date, sub$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")

dev.off()
