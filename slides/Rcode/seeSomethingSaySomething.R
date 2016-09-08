# Shiny app for "if you see something say something"
library(plotly)
populationShare <- 0.01
accuracy <- seq(0, 1, by = 0.01)
sawATerrorist <- accuracy * populationShare / (accuracy * populationShare + (1 - accuracy) * (1 - populationShare))

plot_ly(x = accuracy, y = sawATerrorist, type = "line")
