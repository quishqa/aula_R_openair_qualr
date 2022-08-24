
au <- read.table("data/au_lytton_05_07_22.csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 na.strings = -9999)
au_pm25 <- subset(au, parameter == "pm25")
au_pm10 <- subset(au, parameter == "pm10")

au_pm25_high <- subset(au_pm25, value >= median(au_pm25$value, na.rm = T))

au_pm25$date <- as.POSIXct(
  strptime(au_pm25$local,
           format = "%Y-%m-%dT%H:%M:%S+10:00",
           tz = "Etc/GMT+10")
)

au_pm25 <- au_pm25[c("date", "value")]
names(au_pm25) <- c("date", "pm25")
summaryPlot(au_pm25)
