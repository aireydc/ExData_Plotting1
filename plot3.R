# plot 3 code

# read & subset data
data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings= "?")
subset_indices = grep("^1/2/2007|^2/2/2007", data$Date)
datatouse = data[subset_indices,]
datatouse$DateTime = paste(datatouse$Date, datatouse$Time)
datatouse$Date = as.Date(datatouse$Date, format = "%d/%m/%Y")
datatouse$DateTime = strptime(datatouse$DateTime, format = "%d/%m/%Y %H:%M:%S")

# plot data
png(filename="plot3.png", height=480, width=480)
with(datatouse, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(datatouse, lines(DateTime, Sub_metering_2, col="red"))
with(datatouse, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
