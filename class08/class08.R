# Generate some example data for clustering
tmp <- c(rnorm(30,-3), rnorm(30,3))
x <- cbind(x=tmp, y=rev(tmp))
plot(x)

# k-means algorithm with 2 centers, run 20 times 
km <- kmeans(x, centers=2, nstart=20)

# Cluster membership assignment vector
plot(x, col=km$cluster)
points(km$centers, col="blue",pch=15, cex=2)
km$totss


# First we need to calculate point (dis)similarity
#   as the Euclidean distance between observations
dist_matrix <- dist(x)
# The hclust() function returns a hierarchical
#  clustering model
hc <- hclust(d = dist_matrix)
# the print method is not so useful here
hc
plot(hc)
#cut the tree
abline(h=6, col="red")
# Cut by height h
cutree(hc, h=6) 
# we can also use k=number of cluster groups I want with
cutree(hc, k=4)

# Using different hierarchical clustering methods
d <- dist_matrix
hc.complete <- hclust(d, method="complete")
plot(hc.complete)
hc.average  <- hclust(d, method="average")
plot(hc.average)
hc.single   <- hclust(d, method="single")
plot(hc.single)


# Step 1. Generate some example data for clustering
x <- rbind(
  matrix(rnorm(100, mean=0, sd = 0.3), ncol = 2),   # c1
  matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2), # c2
  matrix(c(rnorm(50, mean = 1, sd = 0.3),           # c3
           rnorm(50, mean = 0, sd = 0.3)), ncol = 2))
colnames(x) <- c("x", "y")
# Step 2. Plot the data without clustering
plot(x)
# Step 3. Generate colors for known clusters
#         (just so we can compare to hclust results)
col <- as.factor( rep(c("c1","c2","c3"), each=50) )
plot(x, col=col)

d <- dist(x)
hc <- hclust(d)
gp1 <- cutree(hc, k=3) 
plot(x, col=gp1)
plot(hc)
abline(h=2.5, col="blue")
abline(h=2, col="red")


## You can also download this file from the class website!
mydata <- read.csv("https://tinyurl.com/expression-CSV",
                   row.names=1)
head(mydata)
## lets do PCA
pca <- prcomp(t(mydata), scale=TRUE)
## See what is returned by the prcomp() function
attributes(pca)
## A basic PC1 vs PC2 2-D plot
plot(pca$x[,1], pca$x[,2])
## Variance captured per PC
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)
pca.var.per
