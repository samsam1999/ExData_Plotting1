library(plyr)
library(dplyr)

PowerConsumption <- read.table("C:/Users/Sam/Documents/Coursera/Course_ExplorataryData/Quiz1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

PowerConsumption$Time <- as.POSIXct(strptime(paste(PowerConsumption$Date, PowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S"))

PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

PowerConsumption <- filter(PowerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

str(PowerConsumption)

with(PowerConsumption, plot(Time, Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering", col = "black"))

with(PowerConsumption, points(Time, Sub_metering_2, "l", col = "red"))

with(PowerConsumption, points(Time, Sub_metering_3, "l", col = "blue"))

legend("topright", pch = c(NA, NA, NA), lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, filename = "C:/Users/Sam/Documents/Course_Eploratory/plot3.png", width = 480, height = 480)

dev.off()