#1.1 Expressions 
1 + 1
"Arr, matey!"
6*7

#1.2 Logical Values
3 < 4
2 + 2 == 5

#1.3 Variables
x <- 42
x / 2
x <- "Arr, matey!"
x
x <- TRUE 

#1.4 Functions
sum(1, 3, 5)
rep("Yo ho!", times = 3) 
sqrt(16)

#1.5 Help
help(sum)
example(min) 
help(rep) 

#1.6 Files
list.files()
source("bottle1.R")
source("bottle2.R")
# run "bottle2.R"

#2.1 Vectors
c(4, 7, 9)
c('a', 'b', 'c') 
c(1, TRUE, "three") 

#2.2 Sequence Vectors
5:9 
seq(5, 9)
seq(5, 9, 0.5) 
9:5

#2.3 Vector Access
sentence[3]
sentence[1] 
sentence[3] <- "dog"
sentence[4] <- 'to' 
sentence[c(1, 3)] 
sentence[2:4] 
sentence[5:7] <- c('the', 'poop', 'deck')
sentence[6]

#2.4 Vector Names
names(ranks) <- c("first", "second", "third")
ranks["first"] 
ranks["third"] <- 4

#2.5 Plotting One Vector
barplot(vesselsSunk)
names(vesselsSunk) <- c("England", "France", "Norway") 
barplot(vesselsSunk)
barplot(c(1:100))

#2.6 Vector Math
a + 1  
a / 2 
a*2 
a + b
a - b
a == c(1, 99, 3)
a < b 
sin(a) 
sqrt(a)

#2.7 Scatterplots
y <- sin(x) 
plot(x, y)
plot(values, absolutes)

#2.8 NA Values
sum(a)
help(sum) 
sum(a, na.rm = TRUE)

#3.1 Matrices
matrix(0, 3, 4) 
a <- 1:12
print(a)
matrix(a, 3, 4) 
plank <- 1:8 
dim(plank) <- c(2, 4) 
print(plank) 
matrix(1:25, 5, 5)

#3.2 Matrix Access
print(plank) 
plank[2, 3] 
plank[1, 4]
plank[1, 4] <- 0 
plank[2, ] 
plank[, 4] 
plank[, 2:4] 

#3.3 Matrix Plotting
elevation <- matrix(1, 10, 10) 
elevation[4, 6] <- 0 
contour(elevation) 
persp(elevation) 
persp(elevation, expand = 0.2) 
contour(volcano)
persp(volcano, expand = 0.2) 
image(volcano) 

#4.1 Mean
mean(limbs) 
barplot(limbs) 
abline(h = mean(limbs)) 

#4.2 Median
abline(h = mean(limbs))
median(limbs) 
abline(h = median(limbs)) 

#4.3 Standard Deviation
abline(h = meanValue) 
deviation <- sd(pounds) 
abline(h = meanValue + deviation) 
abline(h = meanValue - deviation)

#5.1 Creating Factors
types <- factor(chests) 
print(chests)
print(types) 
as.integer(types) 
levels(types) 

#5.2 Plots with Factors
plot(weights, prices) 
plot(weights, prices, pch = as.integer(types)) 
legend("topright", c("gems", "gold", "silver"), pch = 1:3)
legend("topright", levels(types), pch = 1:length(levels(types)))

#6.1 Data Frames
treasure <- data.frame(weights, prices, types) 
print(treasure) 

#6.2 Data Frame Access
treasure[[2]]
treasure[["weights"]] 
treasure$prices 
treasure$types

#6.3 Loading Data Frames
read.csv("targets.csv") 
read.table("infantry.txt", sep = "\t")
read.table("infantry.txt", sep = "\t", header = TRUE) 

#6.4 Merging Data Frames
merge(x = targets, y = infantry) 
