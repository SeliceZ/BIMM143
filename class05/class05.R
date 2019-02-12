#Class 05 R graphics intro
#Claas5 Introduction to R graphics
#My first boxplot
#`boxplot(rnorm(1000,0))`
x <- rnorm(1000,0)
boxplot(x)

summary(x)
hist(x)
boxplot(x,horizontal = TRUE)

#hands on session2 
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age,weight$Weight,typ="o", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Some title", col="red")

mouse <- read.table("bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")
par()$mar
par(mar = c(5.1, 11.1, 4.1, 2.1))
barplot(mouse$Count, horiz=TRUE, ylab=" ", names.arg = mouse$Feature, las =1, xlim = c(0,80000), main="Number of features in the mouse GRCm38 genome", 
)

x <- c(rnorm(10000),rnorm(10000)+4)
hist(x, breaks = 100)


#handout section3
rainbow <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(rainbow$Count, col=rainbow$Count, names.arg = rainbow$Sample, ylab="Counts", las=2)
palette(c("yellow", "pink"))

genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
plot(genes$Condition1,genes$Condition2, col=genes$State, xlab="Expresssion Con2", ylab = "Expression Con1")
palette(c("yellow", "pink"))
