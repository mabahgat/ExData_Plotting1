# Plot Global Active Power with respect to time

# Load
data <- read.table("household_power_consumption.txt", 
                   header=F, 
                   sep=";", 
                   na.strings="?", 
                   skip=66637, 
                   nrow=2880)

timeStamps <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
info <- data.frame(timeStamps, data[,3])
rm(data)

# Draw
png("plot2.png")
plot(info[,1], 
     info[,2], 
     type="l", 
     xlab = "", 
     ylab = "Global Active Power (Kilowatts)")
dev.off()