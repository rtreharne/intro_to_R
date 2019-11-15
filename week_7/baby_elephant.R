data <- read.csv("baby_elephant.csv")

data$weight_kg <- data$weight_lb*0.454

plot(data$time_month, data$weight_kg, xlab="Time (months)", ylab="Weight (kg)", main="Weight of a baby elephant over 35 months from birth")

lmWeight <- lm(weight_kg~time_month, data=data)

summary(lmWeight)

lines(data$time_month, predict(lmWeight))

text(10, 800, "y = 28.5828x + 36.9492")

extr <- data.frame(time_month=80)

predict(lmWeight, newdata=data.frame(time_month=40))



