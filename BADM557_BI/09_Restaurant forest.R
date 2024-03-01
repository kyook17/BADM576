

#forest
#install.packages("randomForest")
library(randomForest)

Restaurant<-Restaurant_example
str(Restaurant)
## !! important: randomForest can not handle character type - 
#if only one variable is character, you can change it using as.factor()

# the following line change all the character columns into factor type
# numeric columns can be used, normally you don't need to change them 
# If the target of the random forest is numeric, the algorithm will run a regression 
# If the target of the random forest is categorical(factor), the algorithm will run a classification 


Restaurant[ ,1:11]<-lapply( Restaurant[   ,1:11],factor)

str(Restaurant)


set.seed(100)
Ran <-randomForest( rating ~ .,  data=Restaurant, na.action=na.omit ,  ntree=500,
                     importance=TRUE, mtry=5)
# ntree- number of trees to grow
# mtry- number of predictors sampled for splitting at each node.
Ran

#investigate variable importance
varImpPlot(Ran)

#let's use Ran to make a prediction

newcase<-Restaurant[1:5, ]

predict(Ran,newcase)


