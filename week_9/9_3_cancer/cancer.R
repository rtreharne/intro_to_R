
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
                    "fractal dimension")


attach(wdbc)

hist(radius,
     xlim = c(5, 30))

shapiro.test(radius_mean)

malignant <- df[which(df$diagnosis == "M"),]
benign <- df[which(df$diagnosis == "B"),]



boxplot(compactness~diagnosis, 
        data = df)

hist(wdbc$`fractal dimension`)

hist(benign$area_mean)

t.test(malignant$area_mean, benign$area_mean)

library(psych)
describeBy(df, df$diagnosis)

plot(benign$radius_mean, benign$fractal_dimension_mean, col="red",
     xlim=c(5, 30))
points(malignant$radius_mean, malignant$fractal_dimension_mean, col="green")

write.csv(describeBy(df, df$diagnosis)[1], "malignant_summary.csv")

plot(malignant$area_mean, malignant$texture_mean, col="red")
points(benign$area_mean, benign$texture_mean, col="green")
legend(2000, 0.09, 
       c("Malignant", "Benign"),
       col=c("red", "green"),
       pch=1)

t.test(malignant$radius_mean, benign$radius_mean, var.equal=T)