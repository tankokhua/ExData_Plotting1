dt <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
par(mar=c(4,4,2,2))
hist(dt$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
