## loading data
require(data.table)
data = fread("./household_power_consumption.txt", header = TRUE)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
subdata = subset(data, subset = (data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

## editing
datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## plotting
plot(subdata$Global_active_power~subdata$Datetime, type = 'l',
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off
