


library(ggplot2)
library(ggplot2movies)

# ------ two variable plotting



ggplot(movies , aes(x=year, y=rating)) +
  geom_point(size=1)


pl<-ggplot(movies , aes(x=year, y=rating)) +
  geom_bin2d()
pl2<-pl+scale_fill_gradient(high="red", low="green")
pl2

ggplot(movies , aes(x=year, y=rating)) +
  geom_density2d()

ggplot(movies , aes(x=year, y=rating)) +
  geom_smooth()

ggplot(movies , aes(x=year, y=rating)) +
  geom_smooth(method=lm)




# -------- coord
p2<-ggplot(movies, aes(x= year, y=rating))+  geom_point(size=1)p2p2 + coord_cartesian(xlim = c(1850,2020), ylim = c(0,10))p2 +coord_fixed(ratio=12/1)# y 10  x 120

 
# ------- facet
 
p2 + facet_grid(  . ~ Drama) # row ~ colp2 + facet_grid( Drama ~ .)p3<-p2 + facet_grid (Drama ~ Action)

#---------- themes
 #theme_set (theme_minimal())
 
   p3+theme_dark()

#install.packages("ggthemes")
library(ggthemes)
p3+theme_wsj() 
p3+theme_economist()
