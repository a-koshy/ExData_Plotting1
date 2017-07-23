# Read in data and subset for dates
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Reformat Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(with(data, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

attach(data)

# Make the plot
par(mfrow=c(2,2), mar=c(5,4,3,2), oma=c(0.5,0.5,0.5,0.5))

# Plot 1
plot(Time, Global_active_power, type = "n", xlab="", ylab = "Global Active Power (kilowatts)")
lines(Time, Global_active_power)

# Plot 2
plot(Time, Voltage, xlab="datetime", type="n")
lines(Time, Voltage)

# Plot 3
plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2, col="red")
lines(Time, Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=c(1,1,1),
       bty="n")

# Plot 4
plot(Time, Global_reactive_power, xlab="datetime", type="n")
lines(Time, Global_reactive_power)

# Copy to png file
dev.copy(png, file="plot4.png")
dev.off()