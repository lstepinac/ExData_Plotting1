## read file from working directory
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?"))

## filter only two dates
only2dates <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

## initialize output file
png("plot3.png", 480, 480)

## plot the line chart plot3.png
##   "paste" concatenates date and time columns and "strptime" converts them to DateTime data type 
##   I have Croatian regional settings, so the final plot (PNG file) will have Croatian day names "cet" for Thursday, "pet" for Friday, "sub" for Saturday

## prepare the plot area
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))

## plot line charts, one for each Sub-metering
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, col = "black"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red"))
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue"))

## plot the legend in top-right corner
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## close the output file
dev.off()


