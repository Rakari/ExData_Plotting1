# Here I import the data and subset it to be only from the dates February 1st and 2nd the year 2007 and call it subsetdata
data <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?")
subsetdata=subset(data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007")

# Here I add a new variable to the subsetdata, FullDate, which combines the Date and Time variable of the dataset and makes it a POSIXct or a date
date = as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S")
subsetdata$FullDate = date

# Plot 3
png("plot3.png",width=480,height=480)
# I overlap 3 line plots to make one, a Sub_metering_1 plot, a Sub_metering_2 plot and a Sub_metering_3 plot by using the lines function in the last two plots. I also add legends to the plot.
with(subsetdata,plot(FullDate,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
with(subsetdata,lines(FullDate,Sub_metering_2,col="red",type="l"))
with(subsetdata,lines(FullDate,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA, lwd=2, col=c("black", "red", "blue"))
dev.off()