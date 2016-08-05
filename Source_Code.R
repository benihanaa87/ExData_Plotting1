##loading data
Power <- read.table("household_power_consumption.txt", header = T, sep = ";")
Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
Days <- Power[(Power$Date=="2007-02-01") | (Power$Date=="2007-02-02"),]
Days$Global_active_power <- as.numeric(as.character(Days$Global_active_power))
Days$Global_reactive_power <- as.numeric(as.character(Days$Global_reactive_power))
Days$Voltage <- as.numeric(as.character(Days$Voltage))
Days <- transform(Days, timestamp=as.POSIXct(paste(Date, Time)), "%d/m%/%Y %H:%M:%S")
Days$Sub_metering_1 <- as.numeric(as.character(Days$Sub_metering_1))
Days$Sub_metering_2 <- as.numeric(as.character(Days$Sub_metering_2))
Days$Sub_metering_3 <- as.numeric(as.character(Days$Sub_metering_3))


##plot1.png
hist(Days$Global_active_power, main = "Global Active Power" , col="red", xlab="Global Active Power (kilowatts)")



##plot2.png
plot(Days$timestamp,Days$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


##plot3.png
plot(Days$timestamp,Days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Days$timestamp,Days$Sub_metering_2,col="red")
lines(Days$timestamp,Days$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))


##plot4.png
par(mfcol=c(2,2))
plot(Days$timestamp,Days$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Days$timestamp,Days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Days$timestamp,Days$Sub_metering_2,col="red")
lines(Days$timestamp,Days$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

plot(Days$timestamp,Days$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Days$timestamp,Days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")