## ADJUST PATH BELOW BASED ON WHERE YOUR FILE IS STORED
file <- "./data/household_power_consumption.txt"

dt <- loadDataTable(file)
if(is.null(dt)) return ## STOP if data could not be loaded for given path

png(filename = "plot1.png",
    width=480,height=480,units="px")

hist(
  dt$Global_active_power,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatt)"
)

dev.off()
