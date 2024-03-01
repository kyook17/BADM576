usedcars<-X4_data_usedcars

#boxplot
boxplot(usedcars$price, main="boxplot of usedcar price",
        ylab="price($)")

#histogram
hist(usedcars$price, main="Histgram of usedcar price", 
     xlab="Price($)", breaks = 100, 
     xlim = c(0,25000), 
     ylim=c(0,20))


#histogram of SEL model

hist(usedcars$price[usedcars$model=="SEL"], 
     main="Histgram of usedcar price", xlab="Price($)", 
     breaks = 20, 
     xlim = c(0,30000), ylim=c(0,15),
     col="yellow" )

#histogram of SE model

hist(usedcars$price[usedcars$model=="SE"], 
     main="Histgram of usedcar price", xlab="Price($)", 
     breaks = 20, 
     xlim = c(0,30000), ylim=c(0,15), 
     col="red" )


#histogram of all models
hist(usedcars$price, 
     main="Histgram of usedcar price", xlab="Price($)", 
     breaks = 100, 
     col=as.factor(usedcars$model))


#skewness
library(e1071)
skewness(usedcars$price)
#

#scatter plot


plot(x=usedcars$mileage,y=usedcars$price,
     main="Usedcars price by mileage",
     xlab="Mileage",ylab="Price")


plot(x=usedcars$mileage,y=usedcars$price,
     main="Usedcars price by mileage",
     xlab="Mileage",ylab="Price", 
     xlim=c(0,200000), col=as.factor(usedcars$model))

#as.factor()make a character into factor
#text() should be used after plot()

text(usedcars$mileage,usedcars$price,labels=usedcars$model,
     cex=0.4,pos = 1)


# add regression line
plot(x=usedcars$mileage,y=usedcars$price,
     main="Usedcars price by mileage",
     xlab="Mileage",ylab="Price", xlim=c(0,200000), 
     col=as.factor(usedcars$model))

abline(lm(usedcars$price~usedcars$mileage))


#






plot(y=usedcars$price,x=usedcars$year,main="Usedcars price by mileage",
     xlab="Mileage",ylab="Year", xlim=c(1990,2020),ylim = c(0,25000),
     col=as.factor(usedcars$model))

abline(lm(usedcars$price~usedcars$year))
