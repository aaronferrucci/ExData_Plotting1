source("read_data.R")
par(
  bg="transparent"
)
png("plot1.png")
hist(
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)",
  col=2,
  data$Global_active_power
)
dev.off()
