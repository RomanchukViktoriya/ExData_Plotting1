#loading  data
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
my_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Submy_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 2
datetime <- strptime(paste(Submy_data$Date, Submy_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Submy_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()