Data <- subset(read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"))

#Formatting the date column to as.date() class
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data$Time <- strptime(Data$Time, format = "%H:%M:%S")

sub_Data <- subset(Data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

#Create .PNG file
with(sub_Data, hist(sub_Data$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()



