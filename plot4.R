# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset data for February 1-2, 2007
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create the plot4.png file
png("plot4.png", width=480, height=480)

# Set up a 2x2 plotting area
par(mfrow=c(2,2))

# Plot 1: Global Active Power over time
plot(subset_data$DateTime, subset_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# Plot 2: Voltage over time
plot(subset_data$DateTime, subset_data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

# Plot 3: Sub-metering over time
plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col="red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Plot 4: Global Reactive Power over time
plot(subset_data$DateTime, subset_data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Close the PNG device
dev.off()