# Here I import the data and subset it to be only from the dates February 1st and 2nd the year 2007 and call it subsetdata
data <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")
subsetdata=subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

# Here I add a new variable to the subsetdata, FullDate, which combines the Date and Time variable of the dataset and makes it a POSIXct or a date
date = as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S")
subsetdata$FullDate = date

# Plot 2
png(file = "plot2.png", width = 480, height = 480)
# I create a line plot with the Global_active_power and the FullDate variables. I set it to the type l which means it is a line plot and I set the label on the y axis to Global Active Power (kilowatts)
with(subsetdata, plot(FullDate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()