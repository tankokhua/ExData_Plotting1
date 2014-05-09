dt <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt$Date_Time <- paste(dt$Date, dt$Time)
dt$Date_Time <- as.POSIXct(strptime(dt$Date_Time, "%Y-%m-%d %H:%M:%S"))

png(file="plot4.png", height=480, width=480)

par(mfcol = c(2,2))

# Plot "Global Active Power" vs datetime
plot(dt$Date_Time, dt$Global_active_power, xlab="", ylab="Global Active Power", type="l")

# Plot "Energy sub metering" vs datetime
plot(dt$Date_Time, dt$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
points(dt$Date_Time, dt$Sub_metering_1, type="l")
points(dt$Date_Time, dt$Sub_metering_2, type="l", col="red")
points(dt$Date_Time, dt$Sub_metering_3, type="l", col="blue")
legend("topright", cex=0.7, lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot Voltage vs datetime
plot(dt$Date_Time, dt$Voltage, xlab="datetime", ylab="Voltage", type="l")

# Plot Global_reactive_power vs datetime
plot(dt$Date_Time, dt$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


dev.off()
