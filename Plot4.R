Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

sub_data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

#Plot4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(sub_data, {
    plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Voltage ~ Datetime, type = "l", ylab = "Voltage (volt)", xlab = "")
    plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(sub_data$Sub_metering_2 ~ sub_data$Datetime, col = "Red")
    lines(sub_data$Sub_metering_3 ~ sub_data$Datetime, col = "Blue")
    legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")

})

dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()
