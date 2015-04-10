data <- read.csv("~/coursera/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date (data$Date, format = "%d/ %m/ %Y")

date <- subset (data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm (data)

datedata<- paste (as.Date (date$Date), date$Time)
date$DateTime <- as.POSIXct (datedata)

hist(date$Global_active_power, main = "Global Active Power", xlab = "Global Active POwer (kilowatts)", col = "Red")

dev.copy (png, file = "plot1.png", height=480, width=480)
dev.off()