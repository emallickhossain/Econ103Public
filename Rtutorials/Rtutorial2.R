library(datasets)
carData <- mtcars
head(carData)
tail(carData)

### Making Histograms
library(plotly)
carHistogram <- plot_ly(data = carData, x = mpg, type = "histogram")
carHistogram2 <- plot_ly(data = carData, x = mpg, type = "histogram") %>% 
  layout(title = "MPG Histogram", xaxis = list(title = "MPG"), 
         yaxis = list(title = "Frequency"))
carHistogram3 <- plot_ly(data = carData, x = mpg, type = "histogram", 
                         histnorm = "percent") %>% 
  layout(title = "MPG Histogram", xaxis = list(title = "MPG"), 
         yaxis = list(title = "Percent"))

### Scatter Plots
carScatter <- plot_ly(data = carData, x = mpg, y = hp, type = "scatter", 
                      mode = "markers") %>% 
  layout(title = "MPG and Horsepower", xaxis = list(title = "MPG"), 
         yaxis = list(title = "Horsepower"))
carScatter2 <- plot_ly(data = carData, x = mpg, y = hp, type = "scatter", 
                       mode = "markers", color = cyl) %>% 
  layout(title = "MPG and Horsepower", xaxis = list(title = "MPG"), 
         yaxis = list(title = "Horsepower"))

### Box Plots
carBox <- plot_ly(data = carData, y = mpg, type = "box", boxpoints = FALSE) %>% 
  layout(title = "MPG Box Plot")
carBox2 <- plot_ly(data = carData, y = mpg, type = "box", boxpoints = FALSE, 
                   group = cyl) %>% 
  layout(title = "MPG Box Plot", xaxis = list(title = "Cylinders"))

### Summary Statistics
summary(carData)
mean(carData$mpg, na.rm = TRUE)
median(carData$mpg, na.rm = TRUE)

var(carData$mpg, na.rm = TRUE)
sd(carData$mpg, na.rm = TRUE)
sqrt(var(carData$mpg, na.rm = TRUE))

IQR(carData$mpg, na.rm = TRUE)
max(carData$mpg, na.rm = TRUE)
min(carData$mpg, na.rm = TRUE)
max(carData$mpg, na.rm = TRUE) - min(carData$mpg, na.rm = TRUE)
range(carData$mpg, na.rm = TRUE)

quantile(carData$mpg, na.rm = TRUE)
quantile(carData$mpg, na.rm = TRUE, probs = 0.3)
quantile(carData$mpg, na.rm = TRUE, probs = c(0.1, 0.3, 0.7, 0.9))

cor(carData$mpg, carData$hp, use = "complete.obs")
cor(carData, use = "complete.obs")
cov(carData$mpg, carData$hp, use = "complete.obs")
cov(carData, use = "complete.obs")

#Ex-2
library(data.table)
titanic <- fread("https://github.com/emallickhossain/Econ103Public/raw/master/Rtutorials/titanic.csv")
head(titanic)

#Ex-3
titanic <- titanic[, list(pclass, survived, sex, age, fare)]
head(titanic)

#Ex-4
summary(titanic)

#Ex-5
sd(titanic$fare, na.rm = TRUE)
quantile(titanic$fare, 0.9, na.rm = TRUE)
plot_ly(data = titanic, x = fare, type = "histogram")

#Ex-6
plot_ly(data = titanic, y = fare, group = pclass, type = "box", boxpoints = FALSE)

#Ex-7
survivors <- titanic[survived == 1]
summary(survivors)

#Ex-8
titanic[, mean(fare, na.rm = TRUE), by = sex]

#Ex-9
titanic[, mean(survived, na.rm = TRUE), by = list(sex, pclass)]
