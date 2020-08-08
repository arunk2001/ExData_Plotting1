library(dplyr)
hpc<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";")
sub_hpc<-hpc%>%
  filter(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
sub_hpc<-mutate(sub_hpc, dt=paste(sub_hpc$Date, sub_hpc$Time, sep=" "))
sub_hpc$dt<-strptime(sub_hpc$dt, format = "%d/%m/%Y %H:%M:%S")
sub_hpc$Sub_metering_1<-as.numeric(sub_hpc$Sub_metering_1)
sub_hpc$Sub_metering_2<-as.numeric(sub_hpc$Sub_metering_2)
sub_hpc$Sub_metering_3<-as.numeric(sub_hpc$Sub_metering_3)

png(filename = "plot3.png")
plot(sub_hpc$dt,sub_hpc$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(sub_hpc$dt,sub_hpc$Sub_metering_2, type = "l",col="red")
lines(sub_hpc$dt,sub_hpc$Sub_metering_3, type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "-", col = c("black","red","blue"),text.col = c("black","red","blue"))
dev.off()

