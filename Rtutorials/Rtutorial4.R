#Exercise 1
students <- c("Alice", "Bob", "Charlotte", "Dan", "Emily")
sample(x = students, size = 2, replace = FALSE) 

#Exercise 2
random.numbers <- sample(x = 1:10, size = 5, replace = TRUE)
sum(random.numbers)

#Exercise 3
sum(sample(x = 1:6, size = 10, replace = TRUE))

#Exercise 4
my.dice.sum <- function(n.dice, n.sides){
  dice <- sample(1:n.sides, size = n.dice, replace = TRUE)
  return(sum(dice))
}
replicate(100, my.dice.sum(5,4))

# Exercise 5
z <- c(12, 6, 3, 7, 10, 9, 3)
sum(z == 3)/length(z)
sum(z < 7)/length(z)

#Exercise 6
even.more.sims <- replicate(100000, two.dice())
sum(even.more.sims <= 4)/length(even.more.sims)

# Exercise 7
passadieci <- replicate(100000, my.dice.sum(n.dice = 3, n.sides = 6))
sum(passadieci >= 11)/length(passadieci)
sum(passadieci == 11)/length(passadieci)
sum(passadieci == 12)/length(passadieci)
sum((passadieci <= 7) | (passadieci >= 15))/length(passadieci)
plot(table(passadieci)/length(passadieci), xlab = 'Sum', ylab = 'Relative Frequency', main = 'Passadieci Simulation: 100000 Throws')

#Exercise 8
experimentA <- function(){
  rolls <- sample(1:6, size = 4, replace = TRUE)
  condition <- sum(rolls == 6) > 0
  return(condition)
}

experimentB <- function(){
  first.die <- sample(1:6, size = 24, replace = TRUE)
  second.die <- sample(1:6, size = 24, replace = TRUE)
  condition <- sum((first.die == second.die) & (first.die == 6)) > 0
  return(condition)
}

simsA <- replicate(100000, experimentA())
sum(simsA)/length(simsA)
simsB <- replicate(100000, experimentB())
sum(simsB)/length(simsB) 
