## read file from working directory
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?"))

## filter only two dates
only2dates <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

## initialize output file
png("plot4.png", 480, 480)


## "paste" concatenates date and time columns and "strptime" converts them to DateTime data type 
## I have Croatian regional settings, so the final plot (PNG file) will have Croatian day names "cet" for Thursday, "pet" for Friday, "sub" for Saturday


## devide the plot area in 2 x 2 space

par(mfrow=c(2,2))

## 1st chart
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power))

## 2nd chart
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Voltage))


## 3rd chart
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, col = "black"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## 4th chart
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power))


## close the output file
dev.off()


