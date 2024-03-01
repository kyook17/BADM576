########## Introduction ##########

library(geometry)

x=2+3

a <- 6

8 -> b

a = b

y=4+5

10^3
10/2

a <- 10
a = a+10

income <- c(1000,2000,3000)

rm(incom)

mean (income)

# this is a function
x <- rnorm(10, mean=0, sd=2)
mean(x)
plot(x)

# plot 100 random numbers mean of 0 sd of 10
# make the plot twice, save 1 plot as a pdf

y <- rnorm(100, mean=0, sd=10)
plot(y)

# vectors
income <- c(1000, 2000, 3000)
income[2]

income[2]<-5000
income

raise <- c(100, 200, 200)
tot <- income + raise

income*2

########## Vectors ###########


income = c(1000,2000,3000)
income[2]

raise = c(100,200,NA)

income + raise

# Matrices

M1 <- matrix(data = c(1,3,4,5,7,2), nrow=3)
M1
M1[1, 2]  # [row, col]
M1[ , 2]  # second col
M1[2,  ]

M1[3, 2] <- 1000
M1

# Data frame
D1 <- data.frame(ID=c(1,2,3), income=c(100,200,NA))
write.csv(D1, "my_data.csv")

D1
D1[2,2]
D1$income
mean(D1$income)
mean(D1$income, na.rm=T)
mean(D1$income, na.rm=F)

# List
home <- list(pet=c("cat", "dog"), human=c("mom", "dad", "kid"))
home

cat=2
x=cat
x+2

# Missing
income <- c(100, NA, 200, NA)
income[2] <- 500
income
mean(income)
mean(income, na.rm=T)

# If
w=6
if(w>5){
  score = "pass"
}else{
  score = "fail"
}
score

########## Aggregation and Linear Regression ##########

str(usedcars)
summary(usedcars)
summary(usedcars$price)
summary(usedcars[ , c(1,3,5)])

table(usedcars$model, usedcars$transmission)

mean(usedcars$price, na.rm=T)
median(usedcars$price, na.rm=T)

# aggregate
aggregate(usedcars$price, list(usedcars$model), mean)

# please try to use aggregate
# to get the median of price by color
aggregate(usedcars$price, list(usedcars$color), median, na.rm=T)

# spread of data
range(usedcars$price)
quantile(usedcars$price)
sd(usedcars$price)
var(usedcars$price)

# linear regression
m1 <- lm(price~mileage, data=usedcars)
summary(m1)
m2 <- lm(price~color, data=usedcars)
summary(m2)
m3 <- lm(price~mileage+model+year, data=usedcars)
summary(m3)
table(usedcars$model)
lm(price~mileage, data=usedcars)

########## Plot ##########

# boxplot
boxplot(usedcars$price, 
        main="Usedcar Price",
        ylab="price")

# histogram
hist(usedcars$price[usedcars$model=="SE"],
     main="Usedcar Price",
     xlab="price",
     xlim=c(0, 30000),
     ylim=c(0,25),
     breaks = 10,
     col="deeppink")

hist(usedcars$price,
     main="Usedcar Price",
     xlab="price",
     xlim=c(0, 30000),
     ylim=c(0,25),
     breaks = 50,
     col=as.factor(usedcars$model))

# skewness
library(e1071)
skewness(usedcars$price)

# scatter plot
plot(x=usedcars$mileage,
     y=usedcars$price,
     xlab="mileage",
     ylab="price",
     xlim=c(0,200000),
     ylim=c(0,25000),
     col=as.factor(usedcars$model))

text(usedcars$mileage, usedcars$price,
     labels=usedcars$model,
     cex=0.4, pos=1)

# regression line
abline(lm(usedcars$price~usedcars$mileage),
       col="red")

########## ggplot ##########

# install.packages('ggplot2')
# install.packages('ggplot2movies')

library(ggplot2)
library(ggplot2movies)

View(mtcars)
head(mtcars)
tail(mtcars)

# reference
# https://posit.co/resources/cheatsheets
# Three layers: Data, Aesthetics, Geometries
# Facets, Statistics, and Coordinates
ggplot(mtcars, aes (x=mpg, y=hp))+
  geom_point()+
  facet_grid(rows=vars(cyl))+
  stat_smooth()+
  coord_cartesian(xlim=c(0,40))+
  theme_dark()

# histogram
View(movies)
ggplot(movies, aes(x=rating))+
  geom_histogram(binwidth = 0.1, alpha=0.5,
                 color="red", fill="blue")+
  xlab("Movie Rating")+ylab("Count")+ggtitle("Movie Rating")

# scatter plot
ggplot(mtcars, aes (x=wt, y=mpg))+
  geom_point(size=5, alpha=0.5, color="pink")

ggplot(mtcars, aes (x=wt, y=mpg))+
  geom_point(aes(size=hp, shape=factor(cyl)))

ggplot(mtcars, aes (x=wt, y=mpg))+
  geom_point(aes(size=hp, shape=factor(cyl), color=factor(cyl)))

# boxplot
ggplot(mtcars, aes(x=factor(cyl), y=mpg))+
  geom_boxplot() + coord_flip()

# bar
ggplot(mtcars, aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)))

########## ggplot and Layer ##########

library(ggplot2)
library(ggplot2movies)


# two variable plotting
ggplot(movies, aes(x=year, y=rating))+
  geom_point(size=0.5)

p1 <- ggplot(movies, aes(x=year, y=rating))+
  geom_bin2d()

p1 + scale_fill_gradient(high="red", low="pink")


ggplot(movies, aes(x=year, y=rating))+
  geom_density2d()

ggplot(movies, aes(x=year, y=rating))+
  geom_smooth()

ggplot(movies, aes(x=year, y=rating))+
  geom_smooth(method=lm)

View(movies)


# ==coord
p2 <- ggplot(movies, aes(x=year, y=rating))+
  geom_point(size=0.5)

p2
p2 + coord_cartesian(xlim=c(1880, 2010), ylim=c(0,10))

# y=10, y=120
p2 + coord_fixed(ratio=12/1)


# -- facet
p2 + facet_grid(.~Drama) #(row~col)
p2 + facet_grid(Drama~.)
p3 <- p2+facet_grid(Drama~Action)

# themes
p3 + theme_dark()

library(ggthemes)
p3 + theme_economist()
p3 + theme_wsj()

########## Tree building visual ##########

library(readr)
ICOBench <- read_csv("ICOBench.csv")
library(ggplot2)
library(lattice)

View(ICOBench)
summary(ICOBench)

install.packages('caret')
install.packages('rpart')
install.packages('rpart.plot')

library(caret)
library(rpart)
library(rpart.plot)

# set seed to ensure reproducible results
# you can put any number as a starting point, here I put 80

set.seed(80)

# createDataPartition(y, p=0.7, list=TRUE, times=1)
# this function creates a random sample
# y - vector of outcome
# time - number of partitions to create
# p - percentage going to training
# list - results in list or matrix

?createDataPartition

trainIndex <- createDataPartition(ICOBench$Status, p=0.7, list=FALSE, times=1)
trainIndex

########## Training and Testing ##########
library(readr)
ICOBench <- read_csv("ICOBench.csv")

View(ICOBench)

library(ggplot2)
library(lattice)

library(caret)
library(rpart)
library(rpart.plot)

# create training and testing set

set.seed(80)

index <- createDataPartition(ICOBench$Status, p=0.7, list=F, times=1)
trainset <- ICOBench[index,]
testset <- ICOBench[-index,]

tree <- rpart(Status ~ . , trainset, method = "class")
# Status ~ Team + Vision + Expert ...
plot(tree)
text(tree)

rpart.plot(tree, cex=0.7, type=4)

# validate
predict_tree <- predict(tree, testset, type="class")
table(predict_tree, testset$Status)

# sen = TP / Actual P = 7 / 25 = 28%
# spe = TN / Actual N = 97 / 126 = 77.0% 

# Use new dataset
ICO_Newdata <- read_csv("ICO_Newdata.csv")

result <- predict(tree, ICO_Newdata, type = "class")
New_data <- cbind(ICO_Newdata, result)


########## Decision Tree Exercise ##########
install.packages("randomForest")
library(randomForest)

library(readr)
Restaurant <- read_csv("Restaurant_example.csv")
str(Restaurant)
Restaurant[, 1:11] <- lapply(Restaurant[, 1:11], factor)

str(Restaurant)

set.seed(100)
ran <- randomForest(rating ~ . , data=Restaurant,
                    ntree=500,
                    importance=T,
                    mtry=5)
ran

varImpPlot(ran)

# predict
newdata <- Restaurant[1:10, ]
predict(ran, newdata)


