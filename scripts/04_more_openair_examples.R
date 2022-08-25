library(openair)

pin <- readRDS("results/pin_2019.rds")

# Calendario dias com concentração
calendarPlot(pin, pol = "o3")
calendarPlot(pin, pol = "pm25")


# Série temporal com vetores do vento
two_day <- head(pin, 48)

timePlot(two_day, pol = c("no2"),
         windflow = list(scale = 0.1, lwd = 1.5,
                         col = "darkgray"),
         lwd = 2, group = F,
         ylab = "[ug/m3]")

# March 2020
pin_march <- readRDS("results/pin_pol_with_wind.Rds")
timePlot(pin_march, pol = c("nox", "o3"))

# ScatterPlot
ibi <- readRDS("results/ibi_2019.rds")
ibi$NO <- ibi$no / 1.25
ibi$NO2 <- ibi$no2 / 1.88
ibi$NOX <- ibi$no_ppb + ibi$no2_ppb

scatterPlot(ibi, x = "NOX", y = "NO2",
            method = "hexbin", col = "viridis")

# Saving plots
png("results/calendar_plot_pm25.png", width = 7, height = 10, 
    res = 300, units = "in")
calendarPlot(pin, pol = "pm25")
dev.off()

png("results/calendar_plot_o3.png", width = 7, height = 10, 
    res = 300, units = "in")
calendarPlot(pin, pol = "o3")
dev.off()

png("results/pin_march_2020.png", width = 8, height = 5,
    res = 300, units = "in")
timePlot(pin_march, pol = c("nox", "o3"))
dev.off()

png("results/pin_march_wind_no2.png", width = 8, height = 5,
    res = 300, units = "in")
timePlot(two_day, pol = c("no2"),
         windflow = list(scale = 0.1, lwd = 1.5,
                         col = "darkgray"),
         lwd = 2, group = F,
         ylab = "[ug/m3]")
dev.off()

png("results/ibi_nox_no2_scatter.png", width = 5, height = 5,
    res = 300, units = "in")
scatterPlot(ibi, x = "NOX", y = "NO2",
            method = "hexbin", col = "viridis")
dev.off()