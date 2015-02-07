
# Load the data 
data = read.table("household_power_consumption.txt", 
                  sep = ";", na.strings=c("?"), header= T)

# Subsetting the data 

DateTime<-strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S")
 data[,1]<-as.Date(data[,1],format="%d/%m/%Y")

data<-data.frame(DateTime,data)
datasub=subset(data, Date == '2007-02-01' | Date == '2007-02-02', 
               select= c("DateTime", "Date", "Time", "Global_active_power",
                         "Global_reactive_power","Voltage","Global_intensity",
                         "Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Plot 3.

png(filename = "plot3.png", width = 480, height = 480)

plot(datasub[,1],datasub[,8],type="l", xlab="", ylab="Energy sub metering")
lines(datasub[,1],y=datasub[,9],col=2)
lines(datasub[,1],y=datasub[,10],col=4)
legend("topright", lty=1, col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

 dev.off()