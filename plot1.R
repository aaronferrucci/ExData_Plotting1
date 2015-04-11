source("read_data.R")
png("plot1.png")
hist(
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)",
  # ylim=c(0, 1300),
  col=2,
  data$Global_active_power
)
dev.off()
