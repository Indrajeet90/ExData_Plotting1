hpc <- read.csv("~/household_power_consumption.txt", sep=";")

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
# creating the plot
plot(hpc$Global_active_power~hpc$dateTime, type="l", ylab="Global Active Power (kilowatts)")
#copying the plot
dev.copy(png,"plot2.png", width=480, height=480)
#saving the plot
dev.off()
