## loading data
require(data.table)
data = fread("./household_power_consumption.txt", header = TRUE)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
subdata = subset(data, subset = (data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

## plottng
hist(as.numeric(subdata$Global_active_power), col="Red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off



