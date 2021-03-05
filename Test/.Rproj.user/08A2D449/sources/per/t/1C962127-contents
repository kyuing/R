# https://rstudio.cloud/learn/primers/1.1
# https://www.youtube.com/watch?v=jfUTC3mJFdg

myCars <- mtcars
View(myCars)

# extract hourse power and weight
hpAndWt <- data.frame(myCars$hp,myCars$wt)
View(hpAndWt)

# rename the extracted field
names(hpAndWt) <- c("hp", "wt")  # vector

# install ggplot2
install.packages("ggplot2")

# import ggplot2 library
library(ggplot2)

# access the variables present 
# in the data framework without calling the data frame
attach(hpAndWt)

# init a graph with x to be horse power and y to be weight on axis
# (in other words, set a background of graph)
ggplot(data = hpAndWt,aes(x=hpAndWt$hp,y=hpAndWt$wt))

# let ggplot function have parameters with simplified names
ggplot(hpAndWt,aes(hp,wt))

# e.g. assign the ggplot obj and its param to variables as necessary
HW <- ggplot(hpAndWt,aes(hp,wt)) # HW = horse power and weight
H <- ggplot(hpAndWt,aes(hp)) # H = horse power

# bar example
H+geom_bar(stat = 'identity')
H+geom_histogram(binwidth = 5, fill='green')
