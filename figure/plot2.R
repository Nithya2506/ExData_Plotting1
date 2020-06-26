f_path <- "household_power_consumption.txt"
df <- read.table(f_path, sep = ";",skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
df$Datetime <- paste(df$Date,df$Time)
df$Datetime <- strptime(df$Datetime,"%d/%m/%Y %H:%M:%S")

png("plot2.png")
with(df,plot(Datetime,Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()