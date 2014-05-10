# Plots sub meterings against time

# Load
data <- read.table("household_power_consumption.txt", 
                   header=F, 
                   sep=";", 
                   na.strings="?", 
                   skip=66637, 
                   nrow=2880)

timeStamps <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
info <- data.frame(timeStamps, data[,7], data[,8], data[,9])
rm(data)
meterings <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(info) <- c("Time", meterings)

# Draw
png("plot3.png")
with(info, plot(Time, Sub_metering_1, type = "n", xlab ="",  ylab="Energy sub metering"))
with(info, lines(Time, Sub_metering_1, col="black"))
with(info, lines(Time, Sub_metering_2, col="red"))
with(info, lines(Time, Sub_metering_3, col="blue"))
legend("topright", pch="_", legend=meterings, col=c("black", "red", "blue"))
dev.off()
