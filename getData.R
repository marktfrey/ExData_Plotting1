require("data.table")

# Check for data dir
if (!file.exists("data")) {
  dir.create("data")
}

# Check for data source file, download if needed.
if (!file.exists("data/raw.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data/raw.zip", method="curl")
}

# If the zipfile exists but hasn't been extracted, extract it.
if (!file.exists("data/household_power_consumption.txt")) {
  unzip("data/raw.zip", exdir="data", overwrite=FALSE)
}

# Manually read just the column names to the first row
# and cast to a vector of chars
column_names <- as.character(fread("data/household_power_consumption.txt", nrows=1, header=FALSE))

# Then read in just the columns we need
#
# Since we're only looking for Feb 1 & 2 2007, and the dates are in
# a non zero-padded %d/%m/%Y format, we can match using the regex
#   ^ (beginning of line)
#   [12](next character us a one or a two)
#   /2/2007 (remainder of the date string)
# if we want to be robust against either zero-padded or non-zero-padded
# months/days, we can add the zeroes optionally with 0\? (\? = zero or one of
# the preceding char), for the final regex ^0\?[12]/0\?2/2007
# this will scan the whole file for lines that start with one of the following:
#   1/2/2007, 01/2/2007, 1/02/2007, 01/02/2007,
#   2/2/2007, 02/2/2007, 2/02/2007, 02/02/2007
# using the unix grep command, and store the resulting lines in a datatable 'data'
# due to some weirdness with R's handling of the \ character, we need to double
# up the backslashes
data <- fread("grep '^0\\?[12]/0\\?2/2007' data/household_power_consumption.txt", col.names=column_names)
