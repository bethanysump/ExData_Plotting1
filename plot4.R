# New Assignment for Coursera - Plotting - Plot 4

setwd("~/Documents/Summer Rotation 2017/Coursera")

#Upload the data

data <- read.table("~/Documents/Summer Rotation 2017/Coursera/household_power_consumption.txt", sep = ";", header = TRUE, na = "?")
subdata <- data[which(data$Date == "1/2/2007"), ]
subdata2 <- data[which(data$Date == "2/2/2007"), ]
subdata <- rbind(subdata, subdata2)

#Change the date and time variables to Date/Time classes
subdata$Date_Time <- paste(subdata$Date, subdata$Time)
subdata$Date_Time <- strptime(subdata$Date_Time, "%d/%m/%Y %H:%M:%S")
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")

##Plot

png("plot4.png", width=400, height=400)

par(mfrow=c(2,2))
#topleft
plot(subdata$Date_Time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# topright
plot(subdata$Date_Time, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# bottomleft
plot(subdata$Date_Time, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subdata$Date_Time, subdata$Sub_metering_2, col="red")
lines(subdata$Date_Time, subdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0, cex = 0.7)
# bottomright
plot(subdata$Date_Time, subdata$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subdata$Date_Time, subdata$Global_reactive_power)

dev.off()
