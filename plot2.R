# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset data for February 1-2, 2007
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create the plot2.png file
png("plot2.png", width=480, height=480)

# Create a time series plot of Global Active Power
plot(subset_data$DateTime, subset_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Close the PNG device
dev.off()