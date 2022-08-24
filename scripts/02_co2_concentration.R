# Carregando os dados
co2 <- read.table("data/climate-change.csv",
                  sep =",", dec = ".", header = T)

co2_world  <- subset(co2, Entity == "World" & Year >= 1)
co2_ind_rev <- subset(co2_world, Year >= 1760)

# Uma figura rascunho
plot(co2_world$Year, co2_world$CO2.concentrations)

# Uma melhor figura
png("results/co2_world_2022.png", width = 8, height = 5, units = "in",
    res = 300)
plot(co2_world$Year, co2_world$CO2.concentrations, 
     t = "n", # Não plote nada
     xaxt = "n", # Não coloca o eixo x
     yaxt = "n", # Não coloca o eixo y
     ylab = "CO2 [ppm]",
     xlab = "Years",
     main = "World CO2 concentration")
axis(2) # Eixo y
axis(1, at = seq(0, 2022, 250), lab = seq(0, 2022, 250))
abline(v = 1750, col = "grey")
lines(co2_world$Year, co2_world$CO2.concentrations, lty = 1, col = "Black")
lines(co2_ind_rev$Year, co2_ind_rev$CO2.concentrations, lty = 1,
      lwd = 2, col = "Red")
legend("topleft", legend = c("Before Ind. Rev.", "After Ind. Rev"),
       lty = 1, lwd = 2, col = c("Black", "Red"), bty = "n")
dev.off()