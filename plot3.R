
alldata <-read.table("household_power_consumption.txt", colClasses=c("character","character","numeric","numeric","numeric",
                                                                     "numeric", "numeric","numeric","numeric"), header = TRUE, sep=";", na.string="?")
#DT = mapply(function(x,y) paste(x,y,sep=" "),alldata$Date,alldata$Time)
alldata$Date<-as.Date(alldata$Date, "%d/%m/%Y")
data<-subset(alldata,Date>="2007-02-01" & Date<="2007-02-02")
Z=mapply(function (x,y) paste(x,y,sep=","), as.character(data$Date), data$Time)
DT=strptime(Z, format="%Y-%m-%d,%H:%M:%S")
windows()
png("plot3.png")
with(data,plot(as.POSIXct(DT),Sub_metering_1,type="l",col ="black",ylab="Energy sub metering",xlab=""))
lines(as.POSIXct(DT),data$Sub_metering_2,col="red",xlab="")
lines(as.POSIXct(DT),data$Sub_metering_3,col="blue",ylab="Energy sub metering",xlab="")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),
       col=c("black","red","blue"))
dev.off()