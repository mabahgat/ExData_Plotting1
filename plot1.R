## Draws a histogram for Global Active Power

# Load
data <- read.table("household_power_consumption.txt", 
                   header=F, 
                   sep=";", 
                   na.strings="?", 
                   skip=66637, 
                   nrow=2880)

#Draw
png("plot1.png")
hist(data[,3], 
     col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()