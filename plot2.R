# plot 2 code

# read & subset data
data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings= "?")
subset_indices = grep("^1/2/2007|^2/2/2007", data$Date)
datatouse = data[subset_indices,]
datatouse$DateTime = paste(datatouse$Date, datatouse$Time)
datatouse$Date = as.Date(datatouse$Date, format = "%d/%m/%Y")
datatouse$DateTime = strptime(datatouse$DateTime, format = "%d/%m/%Y %H:%M:%S")

# plot data
png(filename="plot2.png", height=480, width=480)
with(datatouse, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()