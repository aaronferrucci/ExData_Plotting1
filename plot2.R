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
ticks <- c(min(dt), median(dt), max(dt))
make_labels <- function(date) {
  d <- as.Date(as.POSIXct(date, origin="1970-01-01"))
  day_name <- format(d, "%A")
  short_name <- substr(day_name, 0, 3)
  short_name
}

labels <- lapply(ticks, make_labels)
axis(1, 
  at=ticks,
  labels=labels
)
dev.off()

