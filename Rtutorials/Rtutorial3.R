#Exercise #1 - Regression
regLine <- lm(qsec ~ wt, data = mtcars)
plot_ly(data = mtcars, x = wt, y = qsec, type = "scatter", mode = "markers", name = "Data") %>%
  add_trace(x = wt, y = fitted(regLine), type = "lines", name = "Regression") %>%
  add_trace(x = c(min(wt), max(wt)), y = c(mean(qsec), mean(qsec)), mode = "lines",
            line = list(dash = "5px", color = "red"), name = "Average Quarter-Mile Time") %>%
  add_trace(x = c(mean(wt), mean(wt)), y = c(min(qsec), max(qsec)), mode = "lines",
            line = list(dash = "5px", color = "red"), name = "Average Weight")

#Exercise #2 - Write a Function to Calculate Skewness
skew <- function(x){
  x <- x[!is.na(x)]
  numerator <- sum((x - mean(x))^3) / length(x)
  denominator <- sd(x)^3
  return(numerator/denominator)  
}
skew(testData)

#Exercise #3 - Write a Function to Carry Out Linear Regression
myreg <- function(y, x){
  
  keep <- !is.na(x) & !is.na(y)
  x <- x[keep]
  y <- y[keep]
  
  b <- cov(x,y) / var(x)
  a <- mean(y) - b * mean(x)
  
  out <- data.frame(a, b)
  return(out)
  
}
lm(hp ~ mpg, data = mtcars)
myreg(y = mtcars$hp, x = mtcars$mpg)

#Exercise #4 - Are Apple Returns Skewed?
library(e1071)
skew(apple.returns)
skewness(apple.returns)

#Exercise #5 - Repeat the Above for IBM Returns
ibm.prices <- Quandl("GOOG/NYSE_IBM", start_date = "2012-01-01", end_date = "2012-12-31", type = "raw")
head(ibm.prices)
plot_ly(data = ibm.prices, x = Date, y = Close, type = "lines")
ibm.returns <- diff(log(ibm.prices$Close))
plot_ly(y = ibm.returns)
mean(ibm.returns)
sd(ibm.returns)
sum(ibm.returns)
plot_ly(x = ibm.returns, type = "histogram")
mean(ibm.returns)
median(ibm.returns)
skew(ibm.returns)
skewness(ibm.returns)

#Exercise #6 - Correlations between Returns
boa.prices <- Quandl("GOOG/NYSE_BAC", start_date = "2012-01-01", end_date = "2012-12-31", type = "raw")
boa.returns <- diff(log(boa.prices$Close))
cor(boa.returns, apple.returns)
cor(apple.returns, ibm.returns)
cor(boa.returns, ibm.returns)
