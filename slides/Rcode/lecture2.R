library(data.table)
library(plotly)
library(e1071)
library(datasets)

# Loading data
salaryData <- fread("https://data.cityofchicago.org/api/views/xzkq-xp2w/rows.csv?accessType=DOWNLOAD")

# Renaming columns
names(salaryData) <- c("Name", "Position", "Dept", "Salary")

# Making salary data numeric
salaryData$Salary <- gsub('\\$', '', salaryData$Salary)
salaryData$Salary <- as.numeric(salaryData$Salary)

# Box Plot
plot_ly(salaryData[Dept %in% c("POLICE", "FIRE", "HEALTH"), ], y = Salary, 
        color = Dept, type = "box", boxpoints = FALSE, 
        showlegend = FALSE) %>%
  layout(title = "Salaries by Department in Chicago")

# Histogram
plot_ly(data = salaryData[Dept == "POLICE"], x = Salary, type = "histogram", 
        nbinsx = 25, opacity = 0.6) %>%
  layout(title = "Salaries in the Chicago Police Department")

plot_ly(data = salaryData[Dept == "POLICE"], x = Salary, type = "histogram", 
        nbinsx = 2, opacity = 0.6) %>%
  layout(title = "Salaries in the Chicago Police Department")

plot_ly(data = salaryData[Dept == "POLICE"], x = Salary, type = "histogram", 
        nbinsx = 200, opacity = 0.6) %>%
  layout(title = "Salaries in the Chicago Police Department")

# Skewness
skewness(salaryData[Dept == "POLICE"]$Salary)
skewness(salaryData[Dept == "FIRE"]$Salary)
skewness(salaryData[Dept == "HEALTH"]$Salary)

# Car Correlations
carStats <- mtcars
x <- list(title = "MPG")
y <- list(title = "Horsepower")
plot_ly(data = carStats, x = carStats$mpg, y = carStats$hp, type = "scatter", mode = "markers") %>%
  layout(xaxis = x, yaxis = y, title = "Horsepower and MPG")

