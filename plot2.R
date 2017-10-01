library(plyr)
library(dplyr)

PowerConsumption <- read.table("C:/Users/Sam/Documents/Coursera/Course_ExplorataryData/Quiz1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

PowerConsumption$Time <- as.POSIXct(strptime(paste(PowerConsumption$Date, PowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S"))

PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

PowerConsumption <- filter(PowerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

str(PowerConsumption)

with(PowerConsumption, plot(Time, Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, filename = "C:/Users/Sam/Documents/Course_Eploratory/plot2.png", width = 480, height = 480)

dev.off()