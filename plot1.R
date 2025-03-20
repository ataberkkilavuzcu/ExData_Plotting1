# Read the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Convert Date and Time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for February 1-2, 2007
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create the plot1.png file
png("plot1.png", width=480, height=480)

# Create a histogram of Global Active Power
hist(subset_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Close the PNG device
dev.off()