# Week 7: Introduction to R

#Task 7.3
# Read the data to a dataframe object as follows
data <- read.csv("week_7/baby_elephant.csv")

# Task 7.4
# Add a column called "weight_kg" to your dataframe
data$weight_kg <- data$weight_lb*0.454

# Plot a scatterplot
plot(data$time_month, data$weight_kg, xlab="Time (months)", ylab="Weight (kg)", main="Weight of a baby elephant over 35 months from birth")

# Create a linear model (i.e. straight line fit)
lmWeight <- lm(weight_kg~time_month, data=data)

# output the summary of your fit
summary(lmWeight)

# Add a trendline to your plot
lines(data$time_month, predict(lmWeight))

# An easier way of doint this is ...
abline(lmWeight)



# Add the straight line equation to your plot
text(10, 800, "y = 28.5828x + 36.9492")


# Predict what the elephant's weight will be after 40 months
predict(lmWeight, newdata=data.frame(time_month=40))



