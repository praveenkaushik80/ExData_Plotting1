## Exploratory Data Analysis Project

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

Dataset:
[Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) [20Mb]
</br>Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
```R
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
```
![](https://github.com/praveenkaushik80/ExData_Plotting1/blob/master/plot1.png)
```R
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
```
![](https://github.com/praveenkaushik80/ExData_Plotting1/blob/master/plot2.png)
```R
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
png("plot3.png", width=480, height=480)
# Plot 3
plot(pwrDT[, dateTime], pwrDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_2],col="red")
lines(pwrDT[, dateTime], pwrDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
```
![](https://github.com/praveenkaushik80/ExData_Plotting1/blob/master/plot3.png)
```R
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
```
![](https://github.com/praveenkaushik80/ExData_Plotting1/blob/master/plot4.png)
