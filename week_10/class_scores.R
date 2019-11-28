# Task 10.1.1

# Read in student math scores from .csv file
math <- read.csv("week_10/student-mat.csv", sep=";")

# filter out zero scores
math_nozero_G3 <- math[which(math$G3>0),]

# another way of doing this would be using the subset function
math_nozero_G3 <- subset(math, G3>0)

# Task 10.1.2

boxplot(G3~Walc, data=math_nozero_G3,
        xlab="Weekly Alcohol Intake Rating (1 to 5)",
        ylab="G3 Test Score",
        main="G3 Test scores with respect to Weekly Alcohol Intake Rating")

# Task 10.1.3

G3_walc_low <- math_nozero_G3[which(math_nozero_G3$Walc <3),]$G3
G3_walc_high <- math_nozero_G3[which(math_nozero_G3$Walc >= 3),]$G3

# OR using the subset function
G3_walc_low <- subset(math_nozero_G3, Walc < 3)$G3
G3_walc_high <- subset(math_nozero_G3, Walc >= 3)$G3

# Task 10.1.4

library(psych)
describe(G3_walc_low)
describe(G3_walc_high)

# Task 10.1.5

h1 <- hist(G3_walc_low)
h2 <- hist(G3_walc_high)

col_1 <- rgb(1,0,0,0.3)
col_2 <- rgb(0,1,0,0.3)

plot(h1, col=col_1,
     main="",
     xlab="G3 Test Scores",
     ylim=c(0,50))
plot(h2, col=col_2, add=T)

legend("topright", c("Walc < 3", "Walc >= 3"), fill=c(col_1, col_2))

# Task 10.1.6

shapiro.test(G3_walc_low)
shapiro.test(G3_walc_high)

t.test(G3_walc_low, G3_walc_high)
