# read the data from the text file
data <- read.table("Downloads/household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors=FALSE, header =TRUE)

## subset data between 2007-02-01 and 2007-02-02

data2<-data[min(which(data$Date == "1/2/2007")):max(which(data$Date == "2/2/2007")),]

## change the plot setting
par(mfrow = c(2, 2))

## create the first plot
with(data2, plot(Global_active_power, xaxt="n",type="l",ylab="Global Active Power",xlab=""))

## label x axis
axis(1, at = c(1, dim(data2)[1]/2, dim(data2)[1]), labels=c("Thu","Fri","Sat"))

## create the second plot
with(data2, plot(Voltage, xaxt="n",type="l",ylab="Voltage",xlab="datetime"))

## label x axis
axis(1, at = c(1, dim(data2)[1]/2, dim(data2)[1]), labels=c("Thu","Fri","Sat"))

## create the third plot
with(data2, plot(Sub_metering_1, type ="n",xaxt ="n", xlab ="", ylab = "Energy sub metering"))


## add x axis 
axis(1, at = c(1, dim(data2)[1]/2, dim(data2)[1]), labels=c("Thu","Fri","Sat"))


## plot Sub_metering_1 

with(data2,{ 
        points(Sub_metering_1, type="l")
        points(Sub_metering_2, type="l", col="red")
        points(Sub_metering_3, type="l", col="blue")
})

## add legends 
legend("topright", lty = c(1,1,1),col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")


## create the plot 4
with(data2, plot(Global_reactive_power, type ="l",xaxt ="n", xlab ="", ylab = "Global reactive power"))

## add x axis 
axis(1, at = c(1, dim(data2)[1]/2, dim(data2)[1]), labels=c("Thu","Fri","Sat"))


dev.copy(png, file = "plot4.png")

dev.off()


