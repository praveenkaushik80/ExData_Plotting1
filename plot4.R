library("data.table")
setwd("C:/Users/Prave/Desktop/coursera/EDA")

# Reads in data from file then subsets data for specified dates
pwrDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                          )
# Prevents plot from printing in scientific notation
pwrDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
# Making POSIXct date capable of being filtered and graphed by time of day
pwrDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Filter between Dates 2007-02-01 and 2007-02-02
pwrDT <- pwrDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# Plot 1
plot(pwrDT[, dateTime], pwrDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
# Plot 2
plot(pwrDT[, dateTime],pwrDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
# Plot 3
plot(pwrDT[, dateTime], pwrDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_2], col="red")
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
# Plot 4
plot(pwrDT[, dateTime], pwrDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()