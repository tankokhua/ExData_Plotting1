dt <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt$Date_Time <- paste(dt$Date, dt$Time)
dt$Date_Time <- as.POSIXct(strptime(dt$Date_Time, "%Y-%m-%d %H:%M:%S"))
plot(dt$Date_Time, dt$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
