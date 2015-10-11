alldata <-read.table("household_power_consumption.txt", colClasses=c("character","character","numeric","numeric","numeric",
                                                                     "numeric", "numeric","numeric","numeric"), header = TRUE, sep=";", na.string="?")
#DT = mapply(function(x,y) paste(x,y,sep=" "),alldata$Date,alldata$Time)
alldata$Date<-as.Date(alldata$Date, "%d/%m/%Y")
data<-subset(alldata,Date>="2007-02-01" & Date<="2007-02-02")
png("plot1.png")
hist(data$Global_active_power*1,col="red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
dev.off()


