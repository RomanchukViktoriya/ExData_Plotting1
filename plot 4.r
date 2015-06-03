#loading  data
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
my_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Submy_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 4
datetime <- strptime(paste(Submy_data$Date, Submy_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Submy_data$Global_active_power)
globalReactivePower <- as.numeric(Submy_data$Global_reactive_power)
voltage <- as.numeric(Submy_data$Voltage)
Metering1 <- as.numeric(Submy_data$Sub_metering_1)
Metering2 <- as.numeric(Submy_data$Sub_metering_2)
Metering3 <- as.numeric(Submy_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Metering2, type="l", col="red")
lines(datetime, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()