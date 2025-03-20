# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset data for February 1-2, 2007
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create the plot3.png file
png("plot3.png", width=480, height=480)

# Create a time series plot of the three sub-metering variables
plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col="red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col="blue")

# Add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

# Close the PNG device
dev.off()