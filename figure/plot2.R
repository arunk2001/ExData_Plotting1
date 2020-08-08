library(dplyr)
hpc<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";")
sub_hpc<-hpc%>%
  filter(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
sub_hpc<-mutate(sub_hpc, dt=paste(sub_hpc$Date, sub_hpc$Time, sep=" "))
sub_hpc$dt<-strptime(sub_hpc$dt, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(sub_hpc$dt,sub_hpc$Global_active_power, xlab = "", ylab="Global Active POwer(kilowatts) ", type = "l")
dev.off()
