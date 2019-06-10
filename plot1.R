# New Assignment for Coursera - Plotting - Plot 1

setwd("~/Documents/Summer Rotation 2017/Coursera")

#Upload the data and subgroup it

data <- read.table("~/Documents/Summer Rotation 2017/Coursera/household_power_consumption.txt", sep = ";", header = TRUE, na = "?")
subdata <- data[which(data$Date == "2/2/2007"), ]
subdata2 <- data[which(data$Date == "1/2/2007"), ]
subdata <- rbind(subdata, subdata2)

#Change the date and time variables to Date/Time classes
subdata$Date_Time <- paste(subdata$Date, subdata$Time)
subdata$Date_Time <- strptime(subdata$Date_Time, "%d/%m/%Y %H:%M:%S")
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")


png("plot1.png", width=400, height=400)

hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
