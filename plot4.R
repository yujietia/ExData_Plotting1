## loading data
require(data.table)
data = fread("./household_power_consumption.txt", header = TRUE)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
subdata = subset(data, subset = (data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

## editing
datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## plotting
par(mfrow = c(2, 2))
with(subdata, {
    plot(Global_active_power~Datetime, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Voltage~Datetime, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Sub_metering_1~Datetime, type = 'l', col = "black",
         xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2~Datetime, col = "red")
    lines(Sub_metering_3~Datetime, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1, lwd = 2)
    plot(Global_reactive_power~Datetime, type = "l", xlab = "datetime",
         ylab = "Global_reactive_power")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off
