power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power1 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
power1$Date <- as.Date(power1$Date, format="%d/%m/%Y")
powertime <- paste(as.Date(power1$Date), power1$Time)
power1$Datetime <- as.POSIXct(powertime)

with(power1, plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
lines(power1$Sub_metering_2~power1$Datetime,col='Red')
lines(power1$Sub_metering_3~power1$Datetime,col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png("plot3.png", width=480, height=480)
dev.off()
