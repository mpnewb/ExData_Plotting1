## read the data from the file, household_power_consumption.txt
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

## extract the data for dates 2007-02-01 and 2007-02-02 and save to mydata data frame.
mydata <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))

## combine the Date and Time strings into one string and add a new varialbe DateTime to mydata dataframe
mydata$DateTime <- paste(mydata$Date, mydata$Time)

## Convert DateTime variable from string to Date
mydata$DateTime <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

## open the device
png(filename = "plot2.png", width = 480, height = 480)

## plot the line graph with DateTime on x-axis and Global_active_power on y-axis
plot(mydata$DateTime, mydata$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
