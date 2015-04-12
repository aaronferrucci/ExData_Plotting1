source("read_data.R")
par(
  bg="transparent"
)

png("plot2.png")
plot(
  dt,
  data$Global_active_power,
  type="l",
  xlab="",
  xaxt="n",
  ylab="Global Active Power (kilowatts)",
)

labels <- lapply(ticks, make_labels)
axis(1, 
  at=get_ticks(),
  labels=get_labels()
)
dev.off()

