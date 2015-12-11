## Generate a multiline chart of submetering over time for the 2 day period

# NOTE!!
# The code for fetching and processing the dataset
# is the same for all 4 plot-generating files in this
# assignment, so it has been extracted to 'getData.R'
# rather than being unnecessarily duplicated.

# Fetch the dataset
source("getData.R")

# Setup metadata for chart
type    <- "n"
x_label <- ""
x_range <- range(data$DateTime)
y_label <- "Energy sub metering"
y_range <- range(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
colors  <- c('black', 'red', 'blue')
columns <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Plot the chart with the correct axes, but no lines
plot(type = "n", xRange <- x_range, xlab = x_label,
                 yRange <- y_range, ylab = y_label, col = colors)

# Plot the lines in the correct colors
lines(data$DateTime, data$Sub_metering_1, col=colors[1])
lines(data$DateTime, data$Sub_metering_2, col=colors[2])
lines(data$DateTime, data$Sub_metering_3, col=colors[3])

# Add the legend
legend("topright", columns, col=colors, lty=1, cex=.75)

# Use the png graphic device to generate the image file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
