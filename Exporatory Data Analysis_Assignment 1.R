##loading data

Power <- read.table(file, header = T, sep = ";")
Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
Days <- Power[(Power$Date=="2007-02-01") | (Power$Date=="2007-02-02"),]
GAP <- as.numeric(as.character(Days$Global_active_power))
GRP <- as.numeric(as.character(Days$Global_reactive_power))
Vltg <- as.numeric(as.character(Days$Voltage))
Days <- transform(Days, timestamp=as.POSIXct(paste(Date, Time)), "%d/m%/%Y %H:%M:%S")
SM1 <- as.numeric(as.character(Days$Sub_metering_1))
SM2 <- as.numeric(as.character(Days$Sub_metering_2))
SM3 <- as.numeric(as.character(Days$Sub_metering_3))


##plot1.png

Plot1 <- function() 
hist(GAP, main = "Global Active Power") , col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


