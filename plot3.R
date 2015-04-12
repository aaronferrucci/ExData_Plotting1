source("read_data.R")
png("plot3.png")
par(
  bg="transparent"
)

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
  legend = c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)
dev.off()

