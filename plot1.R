## read the data from the file, household_power_consumption.txt
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

## extract the data for dates 2007-02-01 and 2007-02-02 and save to mydata data frame.
mydata <- subset(data, (Date == "1/2/2007") | (Date == "2/2/2007"))

## open the device
png(filename = "plot1.png", width = 480, height = 480)

## plot the histogram
hist(mydata$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")