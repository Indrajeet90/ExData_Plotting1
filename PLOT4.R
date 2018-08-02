pc <- read.csv("~/household_power_consumption.txt", sep=";")

#Converting global power to numerical variable
summary(hpc$Global_active_power)
hpc$Global_active_power <- as.character(hpc$Global_active_power)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
summary(hpc$Global_active_power)

#Converting to date type
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
#creating subset
hpc <- subset(hpc,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#removing rows with missing values
hpc<- hpc[complete.cases(hpc),]

#adding date and time colmn and convert to date type
hpc$dateTime <- paste(hpc$Date,hpc$Time)
hpc$dateTime <- as.POSIXct(hpc$dateTime)

# creating plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(hpc$Global_active_power~hpc$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(hpc$dateTime,hpc$Voltage, type="l", ylab="Voltage (volt)", xlab="")
plot(hpc$dateTime,hpc$Sub_metering_1,type='l',xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hpc$dateTime,hpc$Sub_metering_2,col="red")
lines(hpc$dateTime,hpc$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty =1,lwd = 2, bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$dateTime,hpc$Global_reactive_power, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
#copying the plot
dev.copy(png,"plot4.png", width=480, height=480)
#saving the plot
dev.off()
