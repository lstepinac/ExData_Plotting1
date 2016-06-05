## read file from working directory
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?"))

## filter only two dates
only2dates <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

## initialize output file
png("plot1.png", 480, 480)

## plot the histogram plot1.R
hist(only2dates$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

## close the output file
dev.off()
