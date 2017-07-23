# Read in data and subset for dates
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Reformat Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(with(data, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

attach(data)

# Make the plot
plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2, col="red")
lines(Time, Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=c(1,1,1))



# Copy to png file
dev.copy(png, file="plot3.png")
dev.off()