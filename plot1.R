dt <- read.table("a.txt", sep=";", header=TRUE)
par(mar=c(4,4,2,2))
hist(dt$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()