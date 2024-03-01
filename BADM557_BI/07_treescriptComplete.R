
#------------------set up -------------------------------------------------

#import dataset ICO_Bench.csv  (Upper right hand side Enviroment tab, use "from text" for csv file)
ICOBench <- read_csv("ICOBench.csv")
View(ICOBench)
summary(ICOBench)

#---------split training and testing dataset  -----------------------------

#install and load caret package

#install.packages('caret')
library(caret)

library(rpart)
library(rpart.plot)

#set seed to ensure reproducible results
# you can put any number as a starting point, here I put 80

set.seed(80)

# createDataPartition(y, p = 0.7,list = TRUE,times = 1 )
# this function creates a random sample
# y - vector of outcome
# times -number of partitions to create,
# p-percentage going to training
# list -results in list or matrix

trainIndex <- createDataPartition (ICOBench$Status, p=0.7, list=FALSE,times=1 )
trainIndex

trainset <- ICOBench[trainIndex, ]

testset <- ICOBench[-trainIndex, ]


View(trainset)
View(testset)



#----another way to splite training and testing set
# you can try this if the above function does not work

# install.packages("caTools")
# library("caTools")

# split = sample.split(ICOBench$Status, SplitRatio = 0.7)
# training_set = subset(ICObench, split == TRUE)
# test_set = subset(ICObench, split == FALSE)

##-------------------------




# -------------Building the tree    ------------------------------------
#install and load rpart and rpart.plot package

library(rpart)
library(rpart.plot)

#decision tree with target variable "Status",
#method "class" is used for categorical target variable. One  of"anova","poisson","class"or"exp".   If method is  missing  then the  routine  tries  to  make  an  intelligent  guess.   If y is  a  survival  object,  thenmethod = "exp"is assumed, if y has 2 columns then method = "poisson" is  assumed,  if y is  a  factor  then method  =  "class"is  assumed,  other wise method = "anova" is assumed

tree <- rpart (Status ~ . , trainset, method="class")

plot(tree)
text(tree)
tree

# If you want to only use some variables to make the tree, you can pick whichones to use
#tree2 <- rpart(Status~Team+Vision+Product, trainset, method="class")

#plot(tree2)
#text(tree2)


#To plot a better tree
#type chooses one of the output formats, cex is the size of the text

rpart.plot (tree,type=4,cex=.4)

rpart.plot(tree,type=2,cex=.4)


# Each node shows-
#the predicted class,
#the predicted probability of survival (positive case),
#the percentage of observations in the node.
#additional resources at http://www.milbo.org/rpart-plot/prp.pdf

#------------Validate decision tree -----------------------------

predict_tree <- predict (tree, testset, type="class")


# in predict() function, tree is the model name, testset is the dataset name,
# type "class" is for tartget variable is categorical

predict_tree

table (predict_tree)

table (predict_tree, testset$Status)

table (testset$Status, predict_tree) #notice the format change

#sen = TP / actual P = 41.6%
#spe = TN / actual N = 84.1%

#------------------Predict newdata classes using the tree ---------
ICO_Newdata <- read_csv("ICO_Newdata.csv")
Newdata<-ICO_Newdata
predict_new<- predict(tree, Newdata, type="class")
predict_new


#add the prediction to  newdata
result<- cbind (Newdata,predict_new)
View(result)





#-------------------prune the tree ----------------
printcp (tree)
plotcp (tree)
#cp stands for the complexity parameter
#we want the tree with the lowest cross-validation error (xerror in the table)
# note: rel error is 1-R^2, xstd is the standard error

ptree <- prune (tree, cp=tree$cptable   [which.min(tree$cptable[,"xerror"]), "CP"])

rpart.plot(tree,type=4,cex=.6)
rpart.plot(ptree,type=4,cex=.6)

#use pruned tree to make prediction on test dataset

predict_ptree<-predict(ptree,testset,type="class")
table (predict_ptree,testset$Status)

#use pruned tree to predict the first row in testset
predict(ptree,testset[1,],type="class")
