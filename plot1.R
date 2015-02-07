# Load the data 
data = read.table("household_power_consumption.txt", 
                  sep = ";", na.strings=c("?"), header= T)

# Subsetting the data 

DateTime<-strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S")
 data[,1]<-as.Date(data[,1],format="%d/%m/%Y")


data<-data.frame(DateTime,data)

datasub=subset(data, Date == '2007-02-01' | Date == '2007-02-02', 
               select= c("Global_active_power"))

# Plot 1. 

png(filename = "plot1.png", width = 480, height = 480)
 with(datasub,hist(Global_active_power,main="Global Active Power",
                  xlab="Global Active Power (kilowatts)",col="red"))
  dev.off()