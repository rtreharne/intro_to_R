# 9.2 Liverpool Vs Everton

# This Exercise will show you how to:
#  + investigate the descriptive statistics of a grouped dataset
#  + create a subsample
#  + plot a histogram (showing frequency or density)
#  + add a normal distribution curve to a histogram
#  + generate boxplots for the groups in your data

# Task 1: Create a new "liverpool_everton.R" file in your "week_9" directory

# Task 2: Download the "fan_data.csv" dataset and copy it to your week_9 directory

# Task 3: Read the data file "fan_data.csv" to a dataframe
fanHeights <- read.csv("week_9/9_2_liverpool_everton/fan_data.csv")

# Task 4: Find the mean, median, range and standard deviation of the data

# There are lots of ways you can do this in R.
# The best way (I find) is to use the "describe" function from the psych package.

# To install the psych package run the line:
install.packages("psych")

# To include the psych package run the line:
library(psych)

# Then you can run the describe function on your data frame
describe(fanHeights)

# Task 5: You can also use th describeBy function to get the descriptive statistics for Liverpool and Everton fans seperately!
describeBy(fanHeights, fanHeights$Team)

# Task 6: Take a subsample of your fanHeights using the line below
mysample <- fanHeights[sample(nrow(fanHeights), 50), ]

# How do your descriptive stats change?
describeBy(mysample, mysample$Team)

# Task 7: Plot a histogram of your data
# Don't forget to give your plot a title and label your axes accordingly
hist(fanHeights$Height_cm,
     main="Histogram of fan heights from a Liverpool Vs Everton match",
     xlab="Height (cm)")

# Task 8: Re-plot your histogram to show Density instead of Frequency and add a normal distribution curve to the plot.

hist(fanHeights$Height_cm, 
     freq = F,
     main = "Height of a sample (N=2000) of fans from Liverpool vs Everton Match",
     xlab = "Height (cm)")

lines(seq(100, 240, by=1), 
      dnorm(seq(100, 240, by=1),
      mean(fanHeights$Height_cm), 
      sd(fanHeights$Height_cm)), 
      col="purple")

# Task 7: Generate a box plot for the height data, grouped by team.
boxplot(Height_cm~Team,
        data = fanHeights,
        ylab = "Height (cm)",
          main="Box plots of Everton Vs Liverpool fans.")
