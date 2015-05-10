file <- "household_power_consumption.txt"
dt <- read.table(file, header=TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))
sub$Date <- strptime(paste(sub$Date, sub$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot1.png")
hist(sub$Global_active_power, col="Red", main="Global Active Power", ylim = c(0,1200), xlab="Global Active Power(kilowatts)")
dev.off()


