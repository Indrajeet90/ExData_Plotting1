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

# creating histogram
hist(hpc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
#copying the plot
dev.copy(png,"plot1.png", width=480, height=480)
#saving the plot
dev.off()
