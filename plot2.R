## ADJUST PATH BELOW BASED ON WHERE YOUR FILE IS STORED
file <- "./data/household_power_consumption.txt"

dt <- loadDataTable(file)
if(is.null(dt)) return ## STOP if data could not be loaded for given path

#load PNG file graphics device
png(filename = "plot2.png",
    width=480,height=480,units="px")

with(
  dt,
  plot(DateTime, Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)"
  )
)

dev.off()