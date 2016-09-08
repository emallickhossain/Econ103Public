library(plotly)
setwd("~/Dropbox/UPenn/Teaching/ECON103Stats/Econ103Public/slides/images")

# Die rolls
set.seed(310)
tenRolls <- sample.int(n = 6, size = 10, replace = TRUE)
hundRolls <- sample.int(n = 6, size = 100, replace = TRUE)
thousRolls <- sample.int(n = 6, size = 1000, replace = TRUE)
millRolls <- sample.int(n = 6, size = 1000000, replace = TRUE)
die1 <- plot_ly(x = tenRolls, type = "histogram", histnorm = "percent", nbinsx = 6) %>%
        layout(title = "Die Rolls", xaxis = list(title = "Roll"), 
               yaxis = list(title = "Relative Frequency"), bargap = 0.75)
die2 <- plot_ly(x = hundRolls, type = "histogram", histnorm = "percent", nbinsx = 6) %>%
        layout(title = "Die Rolls", xaxis = list(title = "Roll"), 
               yaxis = list(title = "Relative Frequency"), bargap = 0.75)
die3 <- plot_ly(x = thousRolls, type = "histogram", histnorm = "percent", nbinsx = 6) %>%
                layout(title = "Die Rolls", xaxis = list(title = "Roll"), 
                       yaxis = list(title = "Relative Frequency"), bargap = 0.75)
die4 <- plot_ly(x = millRolls, type = "histogram", histnorm = "percent", nbinsx = 6) %>%
                layout(title = "Die Rolls", xaxis = list(title = "Roll"), 
                       yaxis = list(title = "Relative Frequency"), bargap = 0.75)

plotly_IMAGE(die1, format = "png", out_file = "die1.png")
plotly_IMAGE(die2, format = "png", out_file = "die2.png")
plotly_IMAGE(die3, format = "png", out_file = "die3.png")
plotly_IMAGE(die4, format = "png", out_file = "die4.png")

# Die roll heatmap
dieMap <- matrix(0, nrow = 6, ncol = 6)
dieMap[5, 2] <- 1
dieMap[5, 5] <- 1
dieMap[3, 2] <- 1
dieMap[2, 3] <- 1
dieMap[2, 4] <- 1
dieMap[3, 5] <- 1

dieHeatMap <- plot_ly(z = dieMap, x = seq(1:6), y = seq(1:6), type = "heatmap", showscale = FALSE)
plotly_IMAGE(dieHeatMap, format = "png", height = 1000, width = 1000, out_file = "dieHeatMap.png")

