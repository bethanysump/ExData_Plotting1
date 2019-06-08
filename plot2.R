# New Assignment for Coursera - Plotting - Plot 2

setwd("~/Documents/Summer Rotation 2017/Coursera")

#Upload the data

data <- read.table("~/Documents/Summer Rotation 2017/Coursera/household_power_consumption.txt", sep = ";", header = TRUE, na = "?")
subdata <- data[which(data$Date == "2/2/2007"), ]
subdata2 <- data[which(data$Date == "1/2/2007"), ]
subdata <- rbind(subdata, subdata2)


png("plot2.png", width=400, height=400)

plot(subdata$Time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
