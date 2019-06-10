# New Assignment for Coursera - Plotting - Plot 3

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

png("plot3.png", width=400, height=400)

plot(subdata$Date_Time, subdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(subdata$Date_Time, subdata$Sub_metering_2, col="red")
lines(subdata$Date_Time, subdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.8)

dev.off()
