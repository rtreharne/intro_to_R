df <- read.csv("formative_question_data/school_scores.csv")

# 1. Which school has the highest mean score for English

which.max(by(df$English, df$School, mean))

# 2. Of the areas which have over 150 pupils in it which has
# the lowest mean scores for Science

classSizeByArea <- data.frame(table(df$Area)) # Create a new table frame which simply counts number of entries for each Area
classSizeByArea["Science"] <- by(df$Science, df$Area, mean) # Add column containing mean science scores
sample <- subset(classSizeByArea, Freq>150) # Generate a subset containing "Area" with more than 150 students in them
which.min(sample$Science) # find Area in subset with lowest science score

# What is the mean class size for schools in Liverpool?

# 4. What is the p-value of an independent t-test used to test the
# following null hypothesis ...
# "There is no significant difference in the mean English scores
# of students in class sizes of above and below 35."

means <- by(df$English, df$School, mean) # Get means of English scores for each school
school_frame <- data.frame(table(df$School)) # Create new datframe containing class sizes for each school
school_frame["mean"] <- df2 # Add English means to class_size dataframe
names(school_frame) <- c("school", "class_size", "english_mean")

group_1 <- subset(school_frame, class_size<=35)$english_mean
group_2 <- subset(school_frame, class_size>35)$english_mean

t.test(group_1, group_2)

# 5. What are the t and p values of an independent t-test used to determine the 
# following null hypothesis ..
# "There is no significant difference in the mean Science scores
# between students in Hoylake and West Kirby"?

# subset data
southport <- subset(df, Area=="Southport")
liverpool <- subset(df, Area=="Liverpool")

t.test(southport$Science, liverpool$Science)
byArea <- data.frame(table(df$Area))

df3 <-by(df$Science, df$Area, mean)
byArea["mean"] <- df3

lt <- subset(byArea, Freq>200)

lt$Var1

slim <- df[df$Area %in% lt$Var1,]

slim <- subset(df, Area %in% lt$Var1)

boxplot(slim$Science,slim$Area)

slim$Science
