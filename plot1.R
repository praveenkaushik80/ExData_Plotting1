library("data.table")
setwd("C:/Users/Prave/Desktop/coursera/EDA")

# Reads data from file and subsets data for specified dates
pwrDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                            )
# Prevents histogram from printing in scientific notation
pwrDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# Change Date Column to Type Date
pwrDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Filter between Dates 2007-02-01 and 2007-02-02
pwrDT <- pwrDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)
## Plot1
hist(pwrDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()