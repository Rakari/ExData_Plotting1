# Here I import the data and subset it to be only from the dates February 1st and 2nd the year 2007 and call it subsetdata
data <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")
subsetdata=subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

# Here I add a new variable to the subsetdata, FullDate, which combines the Date and Time variable of the dataset and makes it a POSIXct or a date
date = as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S")
subsetdata$FullDate = date

# Plot 4
png("plot4.png", width = 480, height = 480)
# I set the number of plots to 4, in 2 by 2 dimensions
par(mfrow = c(2,2))

# I create a line plot with the Global_active_power and the FullDate variables. I set it to the type l which means it is a line plot and I set the label on the y axis to Global Active Power (kilowatts)
with(subsetdata, plot(FullDate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# I plot FullDate and Voltage in a line plot and set the label on the x axis to datetime
with(subsetdata, plot(FullDate, Voltage, type="l", xlab="datetime"))

# I overlap 3 line plots to make one, a Sub_metering_1 plot, a Sub_metering_2 plot and a Sub_metering_3 plot by using the lines function in the last two plots. I also add legends to the plot.
with(subsetdata, plot(FullDate,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
with(subsetdata, lines(FullDate,Sub_metering_2,col="red",type="l"))
with(subsetdata, lines(FullDate,Sub_metering_3,type="l",col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA, lwd=2, col=c("black", "red", "blue"), bty = "n")

# I plot FullDate and Global_reactive_power in a line plot
with(subsetdata, plot(FullDate, Global_reactive_power, type="l", xlab="datetime"))
dev.off()