#loading  data
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
my_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Submy_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 3
datetime <- strptime(paste(Submy_data$Date, Submy_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Submy_data$Global_active_power)
Metering1 <- as.numeric(Submy_data$Sub_metering_1)
Metering2 <- as.numeric(Submy_data$Sub_metering_2)
Metering3 <- as.numeric(Submy_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Metering2, type="l", col="red")
lines(datetime, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()