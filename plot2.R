alldata <-read.table("household_power_consumption.txt", colClasses=c("character","character","numeric","numeric","numeric",
                                                                     "numeric", "numeric","numeric","numeric"), header = TRUE, sep=";", na.string="?")
#DT = mapply(function(x,y) paste(x,y,sep=" "),alldata$Date,alldata$Time)
alldata$Date<-as.Date(alldata$Date, "%d/%m/%Y")
data<-subset(alldata,Date>="2007-02-01" & Date<="2007-02-02")
Z=mapply(function (x,y) paste(x,y,sep=","), as.character(data$Date), data$Time)
DT=strptime(Z, format="%Y-%m-%d,%H:%M:%S")
#windows()
png("plot2.png")
plot(data$Global_active_power~as.POSIXct(DT), ylab="Global Active Power (kilowatts)", type="l", xlab="")
dev.off()
