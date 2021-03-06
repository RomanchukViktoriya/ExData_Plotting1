#loading  data
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
my_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Submy_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 1
globalActivePower <- as.numeric(Submy_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
