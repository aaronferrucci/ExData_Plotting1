source("read_data.R")
png("plot1.png")
par(
  bg="transparent"
)
hist(
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)",
  col=2,
  data$Global_active_power
)
dev.off()
