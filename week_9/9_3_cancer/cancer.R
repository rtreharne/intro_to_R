df = read.csv("week_9/9_3_cancer/data.csv")

attach(df)

hist(radius_mean)

malignant <- df[which(df$diagnosis == "M"),]
benign <- df[which(df$diagnosis == "B"),]



boxplot(area_mean~diagnosis, data = df)

hist(malignant$area_mean)

hist(benign$area_mean)

t.test(malignant$area_mean, benign$area_mean)

library(psych)
describeBy(df, df$diagnosis)

write.csv(describeBy(df, df$diagnosis)[1], "malignant_summary.csv")

plot(malignant$area_mean, malignant$texture_mean, col="red")
points(benign$area_mean, benign$texture_mean, col="green")
legend(2000, 0.09, 
       c("Malignant", "Benign"),
       col=c("red", "green"),
       pch=1)
