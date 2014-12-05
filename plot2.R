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

png("plot2.png")
plot(time, power.data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

Sys.setlocale("LC_TIME",locale)
