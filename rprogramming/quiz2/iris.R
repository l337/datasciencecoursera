#question 4
#library(datasets)
#data(mtcars)
#fourthhp <- sapply(split(mtcars$hp, mtcars$cyl), mean)[1]
#eighthhp <- sapply(split(mtcars$hp, mtcars$cyl), mean)[3]
#difference <- eighthhp - fourthhp
#difference

#question 3
#sapply(split(mtcars$mpg, mtcars$cyl), mean)

#library(datasets)
#data(iris)
#question 2 returns the means of Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width
#apply(iris[, 1:4], 2, mean)
#question 1 mean of all Sepal.Length based on Species
#tapply(iris$Sepal.Length, iris$Species, mean)