library(qualR)

start_date <- "01/01/2019"
end_date <- "30/12/2019"

params <- c("O3", "MP2.5", "DV", "VV", "NO", "NO2")

ibi_2019 <- cetesb_retrieve_param(Sys.getenv("QUALAR_USER"),
                                  Sys.getenv("QUALAR_PASS"),
                                  params,
                                  83,
                                  start_date,
                                  end_date,
                                  to_csv = TRUE,
                                  csv_path = "results/")

saveRDS(ibi_2019, file = "results/ibi_2019.rds")

pin_2019 <- cetesb_retrieve_param(Sys.getenv("QUALAR_USER"),
                                  Sys.getenv("QUALAR_PASS"),
                                  params,
                                  "Pinheiros",
                                  start_date,
                                  end_date,
                                  to_csv = TRUE,
                                  csv_path = "results/")
saveRDS(pin_2019, file = "results/pin_2019.rds")


params <- c("MP10", "MP2.5", "NOx", "VV", "DV")
pin <- cetesb_retrieve_param(Sys.getenv("QUALAR_USER"),
                             Sys.getenv("QUALAR_PASS"),
                             params,
                             "Pinheiros",
                             "01/03/2020",
                             "31/03/2020")

saveRDS(pin, file="results/pin_pol_with_wind.Rds")

ibi_2020 <- cetesb_retrieve_param(Sys.getenv("QUALAR_USER"),
                                  Sys.getenv("QUALAR_PASS"),
                                  c("O3", "MP2.5"),
                                  "Ibirapuera",
                                  "01/01/2020",
                                  "31/12/2020")

saveRDS(ibi_2020, file = "results/ibi_2020.rds")
                                  