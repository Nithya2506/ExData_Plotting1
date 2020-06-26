f_path <- "household_power_consumption.txt"
df <- read.table(f_path, sep = ";",skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$Datetime <- paste(df$Date,df$Time)
df$Datetime <- strptime(df$Datetime,"%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(df,plot(Datetime,Sub_metering_1, type = "n",ylab = "Energy sub metering", xlab = ""))
lines(df$Datetime,df$Sub_metering_1,type = "l")
lines(df$Datetime,df$Sub_metering_2,type = "l", col = "red")
lines(df$Datetime,df$Sub_metering_3,type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c("solid","solid","solid"),col = c("black","red","blue"))
dev.off()