## import data from the text file

data <- read.table("Downloads/household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors=FALSE, header =TRUE)
         
## subset data between 2007-02-01 and 2007-02-02
         
data2<-data[min(which(data$Date == "1/2/2007")):max(which(data$Date == "2/2/2007")),] 
             
### plot a histogram
 with(data2 , hist(Global_active_power, col="red",freq =T, xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
    
#### create the png file
dev.copy(png, file = "plot1.png")

dev.off()
    
