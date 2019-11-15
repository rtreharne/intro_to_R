dir = "week_9/9_1_too_many_elephants/lots_of_elephants/"

files <- list.files(dir)

getGradient <- function(fname){
  path = sprintf("%s%s", dir, fname)
  df <- read.csv(path)
  fit <- lm(time_months ~ weight_kg, data = df)
  return(c(fname, fit$coeff[2]))
}

gradVal <- c()

for (file in files) {
  fit <- getGradient(file)
  print(as.numeric(fit[2]))
  gradVal <- c(gradVal, as.numeric(fit[2]))
}

max(gradVal)
which.max(gradVal)
files[which.max(gradVal)]
