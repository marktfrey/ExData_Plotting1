## Generate a line chart of Global Active Power over time for the 2 day period

# NOTE!!
# The code for fetching and processing the dataset
# is the same for all 4 plot-generating files in this
# assignment, so it has been extracted to 'getData.R'
# rather than being unnecessarily duplicated.

# Fetch the dataset
source("getData.R")

# Set up some metadata for the line chart
type    <- "l"
x_label <- ""
y_label <- "Global Active Power (kilowatts)"

# Create the chart
# Note the column data$DateTime is generated in getData.R
plot(data$DateTime, data$Global_active_power,
     type = type, xlab = x_label, ylab = y_label)

# Use the png graphic device to generate the image file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
