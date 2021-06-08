# ref: https://www.youtube.com/watch?v=z4kEdmaQ_64&list=PLRYL8FHwJMhANugMJil-7aljj5wn0z5wS&index=62

### matrix ###
# declare and init a vector
v <- c(1,2,3,4)

# assign v into a variable m using a matrix function whose parameter is v
m <- matrix(v)
m

# output of m:
#        [,1]
# [1,]    1
# [2,]    2
# [3,]    3
# [4,]    4
#
# matrix value assignment in R is column-based by default
##############################################


# you can specify/limit the number of rows
# using nrow function/args,
# even though matrix value assignment is 
# still column-based 
m <- matrix(v, nrow = 2) # 2X2
m
# output of m:
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

# [note]
# if it were to be
# v <- c(1,2,3,4,5)
# m <- matrix(v, nrow = 2) will return:
#
# 2X3
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    1
#
# which means that it's thought that 
# the pointer in matrix goes back to 
# pointing to first element/index in v
# when there's empty space 
# based on a defined matrix size init.
##############################################

# do from 
# https://youtu.be/z4kEdmaQ_64?list=PLRYL8FHwJMhANugMJil-7aljj5wn0z5wS&t=359
