## Generate a histogram for Global Active Power

# NOTE!!
# The code for fetching and processing the dataset
# is the same for all 4 plot-generating files in this
# assignment, so it has been extracted to "getData.R"
# rather than being unnecessarily duplicated.

# Fetch the dataset
source("getData.R")

# Set metainformation for the histogram
color   <- "red"
title   <- "Global Active Power"
x_label <- "Global Active Power (kilowatts)"
y_label <- "Frequency"

# Plot the histogram for global active power
hist(data$Global_active_power,
     col = color, main = title, xlab = x_label, ylab = y_label)

# Use the png graphic device to generate the image file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
