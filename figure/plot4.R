library(dplyr)
hpc<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";")
sub_hpc<-hpc%>%
  filter(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")

sub_hpc$Global_active_power<-as.numeric(sub_hpc$Global_active_power)

sub_hpc$Voltage<-as.numeric(sub_hpc$Voltage)

sub_hpc$Global_reactive_power<-as.numeric(sub_hpc$Global_reactive_power)

sub_hpc<-mutate(sub_hpc, dt=paste(sub_hpc$Date, sub_hpc$Time, sep=" "))

sub_hpc$dt<-strptime(sub_hpc$dt, format = "%d/%m/%Y %H:%M:%S")

sub_hpc$Sub_metering_1<-as.numeric(sub_hpc$Sub_metering_1)
sub_hpc$Sub_metering_2<-as.numeric(sub_hpc$Sub_metering_2)
sub_hpc$Sub_metering_3<-as.numeric(sub_hpc$Sub_metering_3)

png(filename = "plot4.png")
par(mfrow=c(2,2), mar=c(4,4,1,1))
plot(sub_hpc$dt,sub_hpc$Global_active_power, xlab = "", ylab="Global Active POwer(kilowatts) ", type = "l")
plot(sub_hpc$dt,sub_hpc$Voltage, xlab = "datetime", ylab="Voltage ", type = "l")

plot(sub_hpc$dt,sub_hpc$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(sub_hpc$dt,sub_hpc$Sub_metering_2, type = "l",col="red")
lines(sub_hpc$dt,sub_hpc$Sub_metering_3, type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "-", col = c("black","red","blue"),text.col = c("black","red","blue"))

plot(sub_hpc$dt,sub_hpc$Global_reactive_power, xlab = "datetime", ylab= "Voltage ", type = "l")
dev.off()