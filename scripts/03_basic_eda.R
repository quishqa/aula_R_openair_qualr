library(riem)

gru <- riem::riem_measures(station = "SBGR",
                           date_start = "2019-01-01",
                           date_end = "2019-12-31")
summary(gru)

gru$tc <- (gru$tmpf - 32) * 5 / 9
gru$td <- (gru$dwpf - 32) * 5 / 9

mean(gru$tc, na.rm = T)
median(gru$tc, na.rm = T)
sd(gru$tc, na.rm = T)

boxplot(gru$tc)

library(openair)

windRose(gru, wd = "drct", ws = "sknt")
names(gru)[2] <- "date"
windRose(gru, wd = "drct", ws = "sknt", type = "daylight" )
