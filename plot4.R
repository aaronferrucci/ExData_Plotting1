source("read_data.R")

png("plot4.png")
par(
  bg="transparent",
  mfrow=c(2, 2)
)
###### x o
###### o o
plot(
  dt,
  data$Global_active_power,
  type="l",
  xlab="",
  xaxt="n",
  ylab="Global Active Power",
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)

###### 2
###### o x
###### o o
plot(
  dt,
  data$Voltage,
  type="l",
  xlab="datetime",
  xaxt="n",
  ylab="Voltage",
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)

###### 3
###### o o
###### x o
plot(
  dt,
  data$Sub_metering_1,
  type="n",
  xlab="",
  xaxt="n",
  ylab="Energy sub metering",
)

lines(dt, data$Sub_metering_1, col="black")
lines(dt, data$Sub_metering_2, col="red")
lines(dt, data$Sub_metering_3, col="blue")
legend(
  "topright",
  col = c("black" ,"red", "blue"),
  lty = 1,
  bty = "n",
  legend = c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)

###### 4
###### o o
###### o x
plot(
  dt,
  data$Global_reactive_power,
  type="l",
  xlab="datetime",
  xaxt="n",
  ylab="Global_reactive_power",
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)

dev.off()

