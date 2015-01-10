## ADJUST PATH BELOW BASED ON WHERE YOUR FILE IS STORED
file <- "./data/household_power_consumption.txt"

dt <- loadDataTable(file)
if(is.null(dt)) return ## STOP if data could not be loaded for given path

#load PNG file graphics device
png(filename = "plot4.png",
    width=480,height=480,units="px")

# set device layout to 2x2 of plots
par(mfrow=c(2,2))

# Top Left Plot
with(
  dt,
  plot(DateTime, Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)"
  )
)

# Top Right Plot
with(dt,plot(DateTime,Voltage,type="l",xlab="datetime"))

# Bottom Left Plot
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
# legend for Bottom Left plot
legend("topright",
       bty = "n",
       lty = 1,
       lwd = 2,
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

# Bottom Right Plot
with(dt,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

dev.off()