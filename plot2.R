source("read_data.R")
png("plot2.png")
par(
  bg="transparent"
)

plot(
  dt,
  data$Global_active_power,
  type="l",
  xlab="",
  xaxt="n",
  ylab="Global Active Power (kilowatts)",
)

axis(1, 
  at=get_ticks(),
  labels=get_labels()
)
dev.off()

