# Multiple plots

# Load
data <- read.table("household_power_consumption.txt", 
                   header=F, 
                   sep=";", 
                   na.strings="?", 
                   skip=66637, 
                   nrow=2880)

timeStamps <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
info <- data.frame(timeStamps, data[,c(3:9)])
rm(data)
names(info) <- c("Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")

# Draw
png("plot4.png")
par(mfrow=c(2,2))
# Global Active power
with(info, plot(Time, 
                Global_active_power, 
                type="l", 
                xlab = "", 
                ylab = "Global Active Power")
)
# Voltage
with(info, plot(Time,
                Voltage,
                xlab="datatime",
                ylab="Voltage",
                type="l"))
# Energy sub metering
with(info, plot(Time, 
                Sub_metering_1, 
                type = "n", 
                xlab ="",  
                ylab="Energy sub metering"))
with(info, lines(Time, Sub_metering_1, col="black"))
with(info, lines(Time, Sub_metering_2, col="red"))
with(info, lines(Time, Sub_metering_3, col="blue"))
legend("topright", 
       pch="_", 
       legend=meterings, 
       col=c("black", "red", "blue"))
# Global reactive power
with(info, plot(Time,
                Global_reactive_power,
                type="l",
                ylab="Global Reactive Power",
                xlab="datetime"))
dev.off()