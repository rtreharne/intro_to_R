df <- read.csv("formative_question_data/school_scores.csv")

# 1. Which school has the highest mean score for English

max(by(df$English, df$School, mean))

# 2. Which area has the lowest mean score for Science
which.min(by(df$Maths, df$Area, median))

# 3. What percentage of schools have class sizes greater than 40?

classSizeBySchool <- data.frame(table(df$School))
(nrow(subset(classSizeBySchool, Freq > 45))/nrow(classSizeBySchool))*100


# 4. Of the areas which have over 150 pupils in it which has
# the lowest mean scores for Science

classSizeByArea <- data.frame(table(df$Area)) # Create a new table frame which simply counts number of entries for each Area
classSizeByArea["Maths"] <- by(df$Maths, df$Area, mean) # Add column containing mean maths scores
sample <- subset(classSizeByArea, Freq>150) # Generate a subset containing "Area" with more than 150 students in them which.min(sample$Maths) # find Area in subset with lowest maths score
which.min(sample$Maths)

# 5. What is the mean class size for schools in Liverpool?
liverpool <- subset(df, Area == "Liverpool")
df2 <- data.frame(table(liverpool$School))
df2 <- df2[df2$Freq !=0,] # or subset(df, Freq !=0)
mean(df2$Freq)

# 7. What are the t and p values of an independent t-test used to test the
# following null hypothesis ...
# "There is no significant difference in the mean English scores
# of students in class sizes of above and below 35."

means <- by(df$English, df$School, mean) # Get means of English scores for each school
school_frame <- data.frame(table(df$School)) # Create new datframe containing class sizes for each school
school_frame["mean"] <- means # Add English means to class_size dataframe
names(school_frame) <- c("school", "class_size", "english_mean")

group_1 <- subset(school_frame, class_size<=35)$english_mean
group_2 <- subset(school_frame, class_size>35)$english_mean

t.test(group_1, group_2)

# 6. What are the t and p values of an independent t-test used to determine the 
# following null hypothesis ..
# "There is no significant difference in the mean Science scores
# between students in Southport and Liverpool"?

# 6. subset data
southport <- subset(df, Area=="Southport")
liverpool <- subset(df, Area=="Liverpool")

t.test(southport$Science, liverpool$Science)


byArea <- data.frame(table(df$Area))

df3 <-by(df$Science, df$Area, mean)
byArea["mean"] <- df3

# 8.

crosby <- subset(df, Area=="Crosby")

t.test(crosby$Maths, crosby$Science, paired=TRUE)
