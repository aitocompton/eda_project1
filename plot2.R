data <- read.table("Downloads/household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors=FALSE, header =TRUE)

## subset data between 2007-02-01 and 2007-02-02
         
data2<-data[min(which(data$Date == "1/2/2007")):max(which(data$Date == "2/2/2007")),]    
        
## create a plot
with(data2, plot(Global_active_power, xaxt="n",type="l",ylab="Global Active Power (kilowatts)",xlab=""))

## label x axis
axis(1, at = c(1, dim(data2)[1]/2, dim(data2)[1]), labels=c("Thu","Fri","Sat"))
    
#### create the png file
dev.copy(png, file = "plot2.png")

dev.off()
