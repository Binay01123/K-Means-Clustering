library(factoextra)

iris
summary(iris)

unlabeled.data = iris[1:4]
unlabeled.data

#Standardizing/Scaling Data
scaled.unlabeled.data = scale(unlabeled.data)

#The function dist uses Eucilidean distance by default
iris.data = dist(scaled.unlabeled.data)

#ElbowPlot for determining optitmal K's for cluster

fviz_nbclust(scaled.unlabeled.data, kmeans, method = "wss")+
  labs(subtitle = "Elbow Plot")

#Determined 3 as the No. of Cluster

k.means = kmeans(scaled.unlabeled.data, centers = 3 , nstart = 100 )
k.means

#Visualize Clustering
clusters = k.means$cluster
fviz_cluster(list(data= scaled.unlabeled.data, cluster= clusters))
