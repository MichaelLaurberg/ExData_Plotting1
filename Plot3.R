Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

sub_data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

#Plot3
with(sub_data, 
    { plot(sub_data$Sub_metering_1~sub_data$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(sub_data$Sub_metering_2~sub_data$Datetime, col = "Red")
    lines(sub_data$Sub_metering_3 ~ sub_data$Datetime, col = "Blue") 
    legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
