## read file from working directory
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?"))

## filter only two dates
only2dates <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

## initialize output file
png("plot2.png", 480, 480)

## plot the line chart plot2.png
##   "paste" concatenates date and time columns and "strptime" converts them to DateTime data type 
##   I have Croatian regional settings, so the final plot (PNG file) will have Croatian day names "cet" for Thursday, "pet" for Friday, "sub" for Saturday

## prepare the plot area
with(only2dates, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))

## plot line chart
with(only2dates, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power))

## close the output file
dev.off()


