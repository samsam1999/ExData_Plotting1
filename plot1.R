library(plyr)
library(dplyr)

PowerConsumption <- read.table("C:/Users/Sam/Documents/Coursera/Course_ExplorataryData/Quiz1/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE)

PowerConsumption$Time <- as.POSIXct(strptime(paste(PowerConsumption$Date, PowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S"))

PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

PowerConsumption <- filter(PowerConsumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

str(PowerConsumption)

hist(PowerConsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, filename = "C:/Users/Sam/Documents/Course_Eploratory/plot1.png", width = 480, height = 480)

dev.off()