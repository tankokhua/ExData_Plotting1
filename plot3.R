dt <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt$Date_Time <- paste(dt$Date, dt$Time)
dt$Date_Time <- as.POSIXct(strptime(dt$Date_Time, "%Y-%m-%d %H:%M:%S"))
png(file="plot3.png", height=480, width=480)
plot(dt$Date_Time, dt$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
points(dt$Date_Time, dt$Sub_metering_1, type="l")
points(dt$Date_Time, dt$Sub_metering_2, type="l", col="red")
points(dt$Date_Time, dt$Sub_metering_3, type="l", col="blue")
legend("topright", cex=0.7, lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
