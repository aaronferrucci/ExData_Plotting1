# handy setwd() call for my purposes only - your directory structure will be
# different.
# setwd("C:\\Users\\aaronf\\Documents\\classes\\data_science\\exploratory_data_analysis\\project1\\ExData_Plotting1")
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
#data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
# To do: convert date/time to POSIX date/time type.
to_date_time <- function(date, time) {
  as.POSIXct(paste(date, time), "%Y-%m-%d %H:%M:%S", tz="", origin="1970-01-01")
}
dt <- mapply(to_date_time, data$Date, data$Time)
