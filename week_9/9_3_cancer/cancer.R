
wdbc <- read.csv("week_9/9_3_cancer/wdbc.data", header=FALSE)

colnames(wdbc) <- c("ID",
                    "Diagnosis",
                    "radius",
                    "texture",
                    "perimeter",
                    "area",
                    "smoothness",
                    "compactness",
                    "concavity",
                    "concave points",
                    "symmetry",
                    "fractal_dimension")


slice <- wdbc[1:12]

hist(wdbc$radius,
     xlim = c(5, 30),
     freq = F)

shapiro.test(wdbc$radius)

help(shapiro.test)

malignant <- wdbc[which(wdbc$Diagnosis == "M"),]
benign <- wdbc[which(wdbc$Diagnosis == "B"),]



boxplot(radius~Diagnosis, 
        data = wdbc)

hist(wdbc$fractal_dimension)

hist(benign$area)

t.test(malignant$area, benign$area)

library(psych)
describe(slice)
describeBy(slice, slice$Diagnosis)

plot(benign$radius, benign$fractal, col="green",
     xlim=c(5, 30),
     ylim=c(0.045, 0.1),
     xlab="Radius Mean (micron)",
     ylab="Fractal Dimension Mean (No Units)",
     main="Fractal dimension mean Vs Radius mean.")
points(malignant$radius, malignant$fractal_dimension, col="red")

legend(23, 0.1,
       c("Benign", "Malignant"),
       col=c("green", "red"),
       pch=1)
write.csv(describeBy(wdbc, wdbc$Diagnosis)[1], "week_9/9_3_cancer/malignant_summary.csv")

plot(malignant$area, malignant$texture, col="red")
points(benign$area, benign$texture, col="green")
legend(2000, 0.09, 
       c("Malignant", "Benign"),
       col=c("red", "green"),
       pch=1)

t.test(malignant$radius_mean, benign$radius_mean, var.equal=T)