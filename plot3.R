## loading data
require(data.table)
data = fread("./household_power_consumption.txt", header = TRUE)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
subdata = subset(data, subset = (data$Date >= "2007-02-01" & data$Date <= "2007-02-02"))

## editing
datetime <- paste(subdata$Date, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## plotting
with(subdata,{
    plot(Sub_metering_1~Datetime, type = 'l', col = "black",
         xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2~Datetime, col = "red")
    lines(Sub_metering_3~Datetime, col = "blue")
    })
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off
