Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#combined_var <- strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")


#sub_data <- subset(Data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
sub_data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

#Plot2
with(sub_data, plot(sub_data$Datetime, sub_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)", main=" "))
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()


