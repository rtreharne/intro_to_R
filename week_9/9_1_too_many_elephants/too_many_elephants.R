# TASK 9.1: TOO MANY ELEPHANTS

# STEP 1. Create a new directory (folder) in your R project directory.

# STEP 2. Download the "lots_of_elephants.zip" file to your new directory and extract the files.

# Create a new varibale "dir" that contains the path to your extracted directory (relative
# respect to your overall project directory)
dir = "week_9/9_1_too_many_elephants/lots_of_elephants/"

# Create a new variable "files" and assign it a list of all filenames in your extracted directory
files <- list.files(dir)

# OK. We're now going to create a "function" called "getGradient"that performs a 
# straignt line fit (linear regression) for a specified file in the "lots_of_elephants" 
# directory and returns the filename and the gradient for that file.
# between weight and time

# Define a function like this ...
getGradient <- function(dir, fname){
  # construct the path that tells us where the data file is
  # e.g. "week_9/9_1_too_many_elephants/lots_of elephants/elephant_100822"
  path = sprintf("%s%s", dir, fname)
  df <- read.csv(path) # read the data file like you did in last week's workshop
  fit <- lm(weight_kg ~ time_months, data = df) # create a linear model
  return(fit$coeff[2]) # return the filename and gradient as a vector, i.e. (fname, gradient)
}

# Test your function using a filename
getGradient(dir, "elephant_100822")

# Now we're going to create a loops that calls the function above with a new
# filename each time and adds the calculated gradient to a vector called "gradVals"

# Create an empty vector
gradVals <- c()

# loop through your "files" list like this ...
for (file in files) {
  fileGrad <- getGradient(dir, file) # for each file call the "getGradient" gradient function
  gradVals <- c(gradVals, fileGrad) # add the calculate gradient to the gradVal vector
}

max(gradVals) # tells us the maximum gradient
which.max(gradVals) # tells us the index of the maximum value

# we can use this index to tell us the filename the corresponds to the file with the
# maximum gradient, i.e. the elephant that put weight on at the fastest rate.
files[which.max(gradVals)] 

