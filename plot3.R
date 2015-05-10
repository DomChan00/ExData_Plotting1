file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))
sub$Date <- strptime(paste(sub$Date, sub$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(sub$Date, sub$Sub_metering_1, col="black", type = "l", xlab = "", ylab="Energy sub metering")
points(sub$Date, sub$Sub_metering_2, col="red", type = "l")
points(sub$Date, sub$Sub_metering_3, col="blue", type = "l")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

