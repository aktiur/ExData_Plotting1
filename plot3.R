file <- "household_power_consumption.txt"

start <- 66637
end <- 69516

classes <- rep(c("character", "numeric"), times=c(2,7))

power.data <- read.table(file, TRUE, ";", quote="", colClasses = classes,
                         nrows = end, na.strings = "?")[start:end,]

time <- strptime(paste(power.data[,1], power.data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")

# Changing the locale to get the names of days in English
locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

png("plot3.png")
plot(time, power.data$Sub_metering_1, t="l", col = "black",
     xlab = "", ylab="Energy sub metering")
lines(time, power.data$Sub_metering_2, col="red")
lines(time, power.data$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

Sys.setlocale("LC_TIME",locale)
