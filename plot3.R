#To executie the following code, please download the dataset at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip, unzip and stored into a folder "data"

#read data
datafile<-read.table("./data/household_power_consumption.txt", sep=";", header=T, colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),na.strings='?')
datafile$DateTime <- strptime(paste(datafile$Date, datafile$Time),"%d/%m/%Y %H:%M:%S") #format Date/Time into a desired format

data_subset <- subset(datafile,as.Date(DateTime) >= as.Date("2007-02-01")&as.Date(DateTime) <= as.Date("2007-02-02")) # date conversion from character

#produce plot3
plot(data_subset$DateTime, data_subset$Sub_metering_1, yaxt="n", xlab="", ylab="Energy Sub metering",type="l")
lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
axis(side=2,at=seq(0,30,10))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1,1),cex=.6)
dev.copy(png,filename="plot3.png",height=480, width=480, bg="white")
dev.off()
