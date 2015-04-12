#EDA COURSE PROJECT 1
#Carlos Díaz

setwd('D:/Coursera/EDA')

#Download & Read Raw Data:
if(!file.exists("exdata-data-household_power_consumption")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data1.zip")
  unzip("exdata-data-household_power_consumption")
}
file = "./exdata-data-household_power_consumption/household_power_consumption.txt"
DataP1 <- read.csv(file, na.strings = "?", header = T, sep = ";")
sum(is.na(DataP1))
head(DataP1)
tail(DataP1)

DataP1$Date <- as.Date(DataP1$Date, "%d/%m/%Y")
DataP1$FDate <- paste(DataP1$Date, DataP1$Time)
DataP1$Time <- strptime(DataP1$FDate, "%d/%m/%Y %H:%M:%S")

head(DataP1$Date)
head(DataP1$Time)
head(DataP1$FDate)



#Extracting the data It's going to be used (01-02-2007:02-02-2007):

DataP107 <- subset(DataP1, subset = (Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))

head(DataP107$Date)
head(DataP107$Time)
head(DataP107$FDate)
sum(is.na(DataP107))


#Now let's create the graphs:

#Plot 3

png(filename = "plot3.png", width = 480, height = 480)
with(DataP107, {
  plot(Sub_metering_1, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2, col = 'Red')
  lines(Sub_metering_3, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()