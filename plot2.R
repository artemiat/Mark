data <- read.csv("~/coursera/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date (data$Date, format = "%d/ %m/ %Y")

date <- subset (data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm (data)

datedata<- paste (as.Date (date$Date), date$Time)
date$DateTime <- as.POSIXct (datedata)

plot(date$DateTime, date$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy (png, file = "plot2.png", height=480, width=480)
dev.off()