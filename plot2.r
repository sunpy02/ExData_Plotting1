library(sqldf)
DF<- read.csv.sql("household_power_consumption.txt", header=T, sep=";", sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"')
DF$Date<-as.Date(DF$Date,"%d/%m/%Y")
DF$Time<-strptime(paste(DF$Date,DF$Time),"%Y-%m-%d %H:%M:%S")
png(file="plot2.png",width = 480, height = 480, units = "px")
with(DF,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()