library(data.table)
library(plotly)
library(e1071)
library(datasets)
Sys.setenv("plotly_username" = "emallickhossain")
Sys.setenv("plotly_api_key" = "yty4o2de7a")

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
carStats <- data.table(mtcars)
xtitle <- list(title = "Horsepower")
ytitle <- list(title = "MPG")
carStats %>%
  plot_ly(x = carStats$hp, y = carStats$mpg, type = "scatter", mode = "markers") %>%
  layout(xaxis = xtitle, yaxis = ytitle, title = "Horsepower and MPG")

# Basic Regression
reg <- lm(mpg ~ hp, data = carStats)
short_a <- round(reg$coefficients[1], digits = 2)
short_b <- round(reg$coefficients[2], digits = 2)
plot_ly(data = carStats, x = carStats$hp, y = carStats$mpg, type = "scatter", mode = "markers") %>%
  add_trace(x = carStats$hp, y = fitted(reg), mode = "lines") %>%
  layout(xaxis = xtitle, yaxis = ytitle, title = "Horsepower and MPG", showlegend = FALSE)
sd(carStats$mpg)
sd(carStats$hp)
cov(carStats$mpg, carStats$hp)
mean(carStats$mpg)
mean(carStats$hp)
cor(carStats$hp, carStats$mpg)

# Zero Correlation Chart
x = seq(-1, 1, by = 0.1)
y = x^2
plot_ly(x = x, y = y, type = "scatter", mode = "markers") %>%
  layout(title = "Correlation = 0")

# Survey Data
classData <- fread("~/Dropbox/UPenn/Teaching/ECON103Stats/Private/Class Survey/Cleaned_Econ_103_Fall_2016_Survey.csv")
chart <- plot_ly(data = classData, x = salary, y = retirement, type = "scatter", mode = "markers") %>%
         layout(title = "Retirement Savings and Expected Salary")
plotly_IMAGE(x = chart, format = "png", out_file = "~/Dropbox/UPenn/Teaching/ECON103Stats/Econ103Public/slides/images/classSurvey.png")
plot_ly(data = classData, x = team, type = "histogram")
plot_ly(data = classData, x = drink, type = "histogram")
plot_ly(data = classData, x = pennid, y = sat, type = "scatter", mode = "markers")
