#install.packages('ggplot2')
#install.packages('ggplot2movies')

library(ggplot2)
library(ggplot2movies)

# reference 
# https://posit.co/resources/cheatsheets/
# Three layers :  Data, , Aesthetics. Geometries

#---- plot one variable
View(mtcars)
head(mtcars)
tail(mtcars)
pl<-ggplot(mtcars, aes(x=mpg, y= hp))+
  geom_point()
pl

# Next three layers (optional) : 
#Facets , Statistics, and Coordinates
#facet allows us to put multiple plots on the single canvas 

pl +facet_grid(rows=vars(cyl)) +
  stat_smooth()+
  coord_cartesian (xlim=c(5,40))+
  theme_classic()


#-----Histogram
View(movies)
#DATA AESTHETICS
pl<-ggplot(movies,aes(x=rating))
pl
#Geometry
pl + geom_histogram(binwidth=0.2)
pl2<-pl + geom_histogram(binwidth=0.1, color='red', fill="pink", alpha= 0.5) #alpha set transparency
pl3<-pl2+xlab('movie rating')+ylab('Count')

pl3+ggtitle("Movie Rating Distribution")

# ------Scatter plots
 df<- mtcars
 #DATA AESTHETICS
 pl<-ggplot(df, aes(x=wt,y=mpg))
 #GEOMYTRY
pl+geom_point(size=5,alpha=0.5)
pl+geom_point(aes(size=hp)) # define size use other variables, put it aes inside geom layer
pl+geom_point(aes(color=hp))
pl+geom_point(aes(shape=factor(cyl), color=factor(cyl)), size=5) # use factor for categorical variable



#-----boxplot
df<-mtcars
ggplot(df, aes (x=factor(cyl), y=mpg))+
  geom_boxplot()+coord_flip()

#------ bar plots (optional)
  ggplot(mtcars, aes (x=factor(cyl)))+    geom_bar(aes(fill=factor(gear)))

