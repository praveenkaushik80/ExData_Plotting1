library("data.table")
setwd("C:/Users/Prave/Desktop/coursera/EDA")

# Reads data from file and subsets data for specified dates
pwrDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                            )
# Prevents plot from printing in scientific notation
pwrDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# Making POSIXct date capable of being filtered and graphed by time of day
pwrDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Filter between Dates 2007-02-01 and 2007-02-02
pwrDT <- pwrDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
## Plot 2
plot(x = pwrDT[, dateTime]
     , y = pwrDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()