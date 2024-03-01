
#step 1 Import Dataset from left upper hand side window, Environment tab
#step 2 Choose from text(readr) for csv files

usedcars<-X3_data_usedcars

#look at data
str(usedcars)
summary(usedcars)
summary(usedcars$price)
summary(usedcars[,c(2,3,5)])
summary(usedcars[,2:4])


table(usedcars$model) # for categorical variables
table(usedcars$model,usedcars$transmission)



#mean and median
mean(usedcars$price)
mean(usedcars$price, na.rm = TRUE)
median (usedcars$price, narm=T)

# aggregate mean of price by model, 

aggregate(usedcars$price, list(usedcars$model), mean) 

#in a list, column length can be different




#please try to use aggregate 
#to get the median of price by color



#spread of data
range(usedcars$price)
diff(range(usedcars$price))
quantile(usedcars$price)
sd(usedcars$price)
var(usedcars$price)



#linear regression
# lm(target variable ~ predictor variables, data = data source)
l1<-lm(price ~ mileage, data=usedcars)
summary(l1)
l2<-lm(price ~ mileage + model, data=usedcars)
summary(l2)
