## read the data from the file, household_power_consumption.txt
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

## extract the data for dates 2007-02-01 and 2007-02-02 and save to mydata data frame.
mydata <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))

## combine the Date and Time strings into one string and add a new varialbe DateTime to mydata dataframe
mydata$DateTime <- paste(mydata$Date, mydata$Time)

## Convert DateTime variable from string to Date
mydata$DateTime <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

## open the device
png(filename = "plot4.png", width = 480, height = 480)

## setup the two row, two column canvas
par(mfrow = c(2,2))

## plot four graphs 
with(mydata, { plot(DateTime,Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime,Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2,type ="l", col = "red")
  lines(DateTime, Sub_metering_3,type ="l", col = "blue")
  legend ("topright", lty=1,bty="n",col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime,Global_reactive_power, type = 'l', xlab = "datetime")})

