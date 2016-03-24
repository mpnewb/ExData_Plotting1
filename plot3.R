## read the data from the file, household_power_consumption.txt
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

## extract the data for dates 2007-02-01 and 2007-02-02 and save to mydata data frame.
mydata <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))

## combine the Date and Time strings into one string and add a new varialbe DateTime to mydata dataframe
mydata$DateTime <- paste(mydata$Date, mydata$Time)

## Convert DateTime variable from string to Date
mydata$DateTime <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

## open the device
png(filename = "plot3.png", width = 480, height = 480)

## plot the line graph using DateTime and sub_metering_1 first, add to this graph, graph for sub_metering_2 and sub_metering_3
## then, add the legend to the graph
with(mydata, plot(DateTime, Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering"))
with(mydata, lines(DateTime, Sub_metering_2,type ="l", col = "red"))
with(mydata, lines(DateTime, Sub_metering_3,type ="l", col = "blue"))
with(mydata, legend ("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))