data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

data$Date <- as.Date(data$Date)
data$Time <- strptime(with(data, paste(Date, Time)), format = "%Y-%m-%d %H:%M:%S")

attach(data)

hist(Global_active_power,
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()
