file <- "household_power_consumption.txt"

start <- 66637
end <- 69516

classes <- rep(c("factor", "numeric"), times=c(2,7))

power.data <- read.table(file, TRUE, ";", quote="", colClasses = classes,
                         nrows = end, na.strings = "?")[start:end,]

png("plot1.png")
hist(power.data$Global_active_power,
     col="red", xlab="Global Active Power (kilowatts)",
     ylab = "Frequency", main="Global Active Power")
dev.off()