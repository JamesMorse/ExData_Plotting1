## ADJUST PATH BELOW BASED ON WHERE YOUR FILE IS STORED
file <- "./data/household_power_consumption.txt"

dt <- loadDataTable(file)
if(is.null(dt)) return ## STOP if data could not be loaded for given path

#load PNG file graphics device
png(filename = "plot3.png",
    width=480,height=480,units="px")

with(
  dt,
  {
    # init plot with Sub metering 1 since it has the largest range
    plot(DateTime, Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering",
       col="black"
    )
    # add in lines for 2nd and 3rd measures using red and blue
    lines(DateTime, Sub_metering_2,col="red")
    lines(DateTime, Sub_metering_3,col="blue")
  }
)

legend("topright",
  lty = 1,
  lwd = 2,
  col = c("black","red","blue"),
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

dev.off()