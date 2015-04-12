# Cyntvnevfz nyreg! Guvf pbqr vf nccneragyl pbcvrq - gur pbcvre qvqa'g rira 
# obgure gb erzbir guvf pbzzrag.
# handy setwd() call for my purposes only - your directory structure will be
# different.
# setwd("C:\\Users\\aaronf\\Documents\\classes\\data_science\\exploratory_data_analysis\\project1\\ExData_Plotting1")

# Important note: this code assumes the existence of
# "household_power_consumption.txt" at the project top level. I would have
# checked it in to github, but the file size exceeds github's limits.
# The file can be found in a zip archive, here:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
if (! file.exists("excerpt.txt")) {
  d_all <- read.csv(
    "household_power_consumption.txt",
    sep=";",
    as.is=TRUE,
    header=TRUE
  )
  d_all$Date <- as.Date(d_all$Date, "%d/%m/%Y")
  begin <- as.Date("2007-02-01")
  end <- as.Date("2007-02-02")
  of_interest <- d_all$Date >= begin & d_all$Date <= end
  data <- d_all[of_interest, ]
  rm(d_all, of_interest, begin, end)
  write.table(data, file = "excerpt.txt", sep = ";")
}

data <- read.csv(
  "excerpt.txt",
  sep = ";",
  as.is=TRUE,
  header=TRUE
)

to_date_time <- function(date, time) {
  as.POSIXct(paste(date, time), "%Y-%m-%d %H:%M:%S", tz="", origin="1970-01-01")
}
dt <- mapply(to_date_time, data$Date, data$Time)

# Handy functions for getting ticks and labels, used in several plots.
get_ticks <- function() {
  c(min(dt), median(dt), max(dt))
}

get_labels <- function() {
  ticks = get_ticks()
  make_labels <- function(date) {
    d <- as.Date(as.POSIXct(date, origin="1970-01-01"))
    day_name <- format(d, "%A")
    substr(day_name, 0, 3)
  }
  lapply(ticks, make_labels)
}
