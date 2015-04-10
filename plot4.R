data <- read.csv("~/coursera/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date (data$Date, format = "%d/ %m/ %Y")

date <- subset (data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm (data)

datedata<- paste (as.Date (date$Date), date$Time)
date$DateTime <- as.POSIXct (datedata)

par (mfrow = c(2,2))

plot(date$DateTime, date$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(date$DateTime, date$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(date$DateTime, date$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(date$DateTime, date$Sub_metering_2, type="l", col="red")
lines(date$DateTime, date$Sub_metering_3, type="l", col="blue")

legend("topright", col= c ("Black", "Red", "Blue"), lty= , lwd= 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(date$DateTime, date$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy (png, file = "plot4.png", height=480, width=480)
dev.off()
