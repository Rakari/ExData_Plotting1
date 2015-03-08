# Here I import the data and subset it to be only from the dates February 1st and 2nd the year 2007 and call it subsetdata
data <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")
subsetdata=subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

# Here I add a new variable to the subsetdata, FullDate, which combines the Date and Time variable of the dataset and makes it a POSIXct or a date
date = as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S")
subsetdata$FullDate = date

# Plot 1
png(file = "plot1.png", width = 480, height = 480)
# I make a histogram of the Global Active Power of the subsetdata dataset, set the color of it to red, the title to Global Active Power and the label on the x axis to Global Active Power (kilowatts) 
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()