## Generate 4 charts in one, including two slightly
## modified charts we've already seen, and two new line charts

# NOTE!!
# The code for fetching and processing the dataset
# is the same for all 4 plot-generating files in this
# assignment, so it has been extracted to 'getData.R'
# rather than being unnecessarily duplicated.

# Fetch the dataset
source("getData.R")

par(mfcol = c(2, 2))

# First chart (top left)
# Chart 2 redux, no 'kilowatts' in label
type    <- "l"
x_label <- ""
y_label <- "Global Active Power"
plot(data$DateTime, data$Global_active_power,
     type = type, xlab = x_label, ylab = y_label)

# Second chart (bottom left)
# Chart 3 redux, no border on legend
type    <- "n"
x_label <- ""
x_range <- range(data$DateTime)
y_label <- "Energy sub metering"
y_range <- range(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
colors  <- c('black', 'red', 'blue')
columns <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(type = "n", xRange <- x_range, xlab = x_label,
                 yRange <- y_range, ylab = y_label, col = colors)
lines(data$DateTime, data$Sub_metering_1, col=colors[1])
lines(data$DateTime, data$Sub_metering_2, col=colors[2])
lines(data$DateTime, data$Sub_metering_3, col=colors[3])
legend("topright", columns, col=colors, bty = "n", lty=1, cex=.75)

# Third chart (top right)
# Voltage over time
type    <- "l"
x_label <- "datetime"
y_label <- "Voltage"
plot(data$DateTime, data$Voltage,
     type = type, xlab = x_label, ylab = y_label)

# Fourth chart (bottom right)
# Voltage over time
type    <- "l"
x_label <- "datetime"
y_label <- "Global_reactive_power"
plot(data$DateTime, data$Global_reactive_power,
     type = type, xlab = x_label, ylab = y_label)

# Use the png graphic device to generate the image file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
