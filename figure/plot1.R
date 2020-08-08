library(dplyr)
library(readr)
hpc<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";")
sub_hpc<-hpc%>%
  filter(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
sub_hpc$Global_active_power<-as.numeric(sub_hpc$Global_active_power)
png(filename = "plot1.png")
hist(sub_hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()