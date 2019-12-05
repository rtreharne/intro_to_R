df <- read.csv("formative_question_data/titanic/titanic_data.csv")

# Of those that survived what percentage were female?
survived_female <- subset(df, df$Survived == 1 & df$Sex == "female")

nrow(survived_female)/nrow(subset(df, df$Survived == 1))

# What was the mean age of second class passengers?

second = subset(df, df$Pclass == 2)
mean(second$Age)

# What are the t and p-values of an independent T-test used to test the following
# null hypothesis. And, based on the result of the test should the rejected
# or accepted?
# "There is no difference in the mean ages of second class passanges who did
# and did not survive"
t.test(subset(second, Survived == 1)$Age, subset(second, Survived = 0)$Age)

# What is the ratio between the percentage of first and third class children that survived?
# Round your percentages to the nearest whole percent
# Children < 18
third_surv_pc = 100*nrow(subset(df, Survived == 1 & Age <18 & Pclass == 3))/nrow(subset(df, Age < 18 & Pclass == 3))
first_surv_pc = 100*nrow(subset(df, Survived == 1 & Age <18 & Pclass == 1))/nrow(subset(df, Age <18 & Pclass == 1))

# What is the difference in the mean adult fares between first and second class?
first_fare = subset(df, Age>=18 & Pclass == 1)
mean(first_fare$Fare)
not_first_fare = subset(df, Age>=18 & Pclass == 2)
mean(not_first_fare$Fare)
mean(first_fare$Fare) - mean(not_first_fare$Fare)

# What is the probability that you would have survived if you had been a first male who embarked from Southampton?
survived = nrow(subset(df, Sex=="male" & Embarked=="S" & Survived == 1))
died = nrow(subset(df, Sex=="male" & Embarked=="S" & Survived == 0)) 

survived/(survived+died)

# There is no difference in the mean fares of first class passengers who did and did not survive

third_class = subset(df, Pclass == 1)
t.test(subset(third_class, Survived == 1)$Fare, subset(third_class, Survived == 0)$Fare)
