#### Basics ####
#Ex. 1
60 * 24 * 7

#Ex. 2
sum(1, 8, 4, 2, 9, 4, 8, 5)

#Ex. 3
help(rep)
?rep

#Ex. 4
x <- 5
y <- 7
z = x + y 
z + 3 == 15

#Ex. 5
rep("Go Penn!", times = 30)

#Ex. 6
x <- seq(-1, 1, by = 0.1)
x

#### Harry Potter ####
#Ex. 1
wizards <- c("Harry", "Ron", "Fred", "George", "Sirius")
ranking <- c(4, 2, 5, 1, 3)
#Remember that the elements of character vectors need to be enclosed in 
#quotation marks. Either single or double quotes will work.

#Ex. 3
wizards[2]

#Ex. 4
#There are several different ways to do this. Here are two possibilities.
wizards[c(3, 4, 5)] <- c("Hermione", "Ginny", "Malfoy")
wizards[3:5] <- c("Hermione", "Ginny", "Malfoy")

#Ex. 5
names(wizards) <- c("Lead", "Friend", "Friend", "Wife", "Rival")
wizards

#Ex. 6
names(wizards)[5] <- "Ex-Rival"
names(wizards)

#Ex. 7
barplot(ranking) 
#The wizards vector contains character data rather than numerical data so we 
#can't plot it.

#Ex. 8
names(ranking) <- wizards
barplot(ranking)

#### Steve's Finances ####
#Ex. 1
years <- c(2009, 2010, 2011, 2012)
income <- c(50000, 52000, 52500, 48000)
expenses <- c(35000, 34000, 38000, 40000)

#Ex. 2
savings <- income - expenses
plot(years, savings)
plot_ly(x = years, y = savings, type = "scatter", mode = "markers")

#Ex. 3
sum(savings)

#Ex. 4
years <- c(2009, 2010, 2011, 2012, 2013)
income <- c(50000, 52000, 52500, 48000, NA)
#If we just use sum, we'll get NA
sum(income)
#To avoid this, we use the following option to ignore the NA
sum(income, na.rm = TRUE)

#### Summary Stats ####
#Ex. 1
scores <- c(18, 95, 76, 90, 84, 83, 80, 79, 63, 76, 55, 78, 90, 81, 88, 89, 92, 
            73, 83, 72, 85, 66, 77, 82, 99, 87)

#Ex. 2
mean(scores)
median(scores)
sd(scores)

#### Trojan War ####
#Ex. 1
age <- c(21, 26, 51, 22, 160, 160, 160)
person <- c("Achilles", "Hector", "Priam", "Paris", "Apollo", "Athena", "Aphrodite")
description <- c("Aggressive", "Loyal", "Regal", "Cowardly", "Proud", "Wise", "Conniving")

#Ex. 2
trojan.war <- data.table(person, age, description)

#Ex. 3
#There are many different ways to do this:
trojan.war$description 
trojan.war["description"] 

#Ex. 4
#There are several ways to do this. Here are a few:
trojanWar[person == "Achilles" | person == "Hector", ]
trojanWar[person %in% c("Achilles", "Hector"), ]
trojanWar[c(1, 2), ]
trojanWar[1:2, ]

#Ex. 5
#There are many ways to do this. Here are a few:
trojanWar[person %in% c("Apollo", "Athena", "Aphrodite"), .(person, description)]
trojanWar[c(5, 6, 7), c(1, 3)]
trojanWar[5:7, c("person", "description")]

#Ex. 6
#There are many different ways to do this. Here are a few:
trojanWar$age[trojanWar$person == "Priam"] <- 72
trojanWar[3, 2] <- 72
trojanWar$age[3] <- 72
trojanWar
