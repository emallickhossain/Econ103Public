library(plotly)
library(arm)
set.seed(3728)

#Sampling experiment
reg.sample <- function(n){
  
  row.sample <- sample(1:nrow(mtcars), size = n, replace = TRUE)
  data.subset <- mtcars[row.sample,]
  coef(lm(mpg ~ hp, data = data.subset))
  
}#END reg.sample

true.coef <- coef(lm(mpg ~ hp, data = mtcars))
a.true <- true.coef[1]
b.true <- true.coef[2]

# Car Sampling Regressions
attach(mtcars)
plot(hp, mpg, xlab = 'Horsepower', ylab = 'MPG')
abline(a = a.true, b = b.true)
detach(mtcars)

reg.sims <- replicate(1000, reg.sample(25))
reg.sims <- t(reg.sims)
plot(mtcars$hp, mtcars$mpg, xlab = 'Horsepower', ylab = 'MPG', col = 'white')
mapply(abline, a = reg.sims[,1], b = reg.sims[,2], col = rgb(red = 206, green = 206, blue = 206, alpha = 50, maxColorValue = 255))
abline(a = a.true, b = b.true, lwd = 2)

a.sim <- reg.sims[,1]
b.sim <- reg.sims[,2]

aPlot <- plot_ly() %>%
          add_histogram(x = a.sim, nbinsx = 30) %>%
          add_lines(x = c(a.true, a.true), y = c(0, 175)) %>%
          layout(title = "Intercept Estimates", xaxis = list(title = ""),
                 yaxis = list(range = c(0, 200)))

bPlot <- plot_ly() %>%
          add_histogram(x = b.sim, nbinsx = 30) %>% 
          add_lines(x = c(b.true, b.true), y = c(0, 175)) %>%
          layout(title = "Slope Estimates", xaxis = list(title = ""),
                 yaxis = list(range = c(0, 200))) 

subplot(aPlot, bPlot, shareY = TRUE) %>% 
  layout(showlegend = FALSE, annotations = list(
    list(x = 0.13, y = 1.05, text = "Intercept", showarrow = F, 
         xref = "paper", yref = "paper", font = list(size = 20)), 
    list(x = 0.87, y = 1.05, text = "Slope", showarrow = F, 
         xref = "paper", yref = "paper", font = list(size = 20))), 
    title = "")

#Some example regressions 
reg1 <- lm(mpg ~ 1, data = mtcars)
display(reg1)

mean(mtcars$mpg)
sd(mtcars$mpg)/sqrt(length(mtcars$mpg))
sd(mtcars$mpg)

reg2 <- lm(mpg ~ am, data = mtcars)
display(reg2)

manual <- subset(mtcars, am == 1)
automatic <- subset(mtcars, am == 0)

mean(manual$mpg) - mean(automatic$mpg)
sqrt(var(manual$mpg)/length(manual$mpg) + var(automatic$mpg)/length(automatic$mpg))


reg3 <- lm(mpg ~ hp, data = mtcars)
display(reg3)
cor(mtcars$mpg, mtcars$hp)^2




