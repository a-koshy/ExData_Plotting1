# Read in data and subset for dates
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Reformat Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(with(data, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

attach(data)

# Make the plot
plot(Time, Global_active_power, type = "n", xlab="", ylab = "Global Active Power (kilowatts)")
lines(Time, Global_active_power)



# Copy to png file
dev.copy(png, file="plot2.png")
dev.off()