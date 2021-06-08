# ref: https://www.youtube.com/watch?v=z4kEdmaQ_64&list=PLRYL8FHwJMhANugMJil-7aljj5wn0z5wS&index=62


### calc in vector ###
# a calc is done by pointing to the corresponding element/index each in x and y and return value.
x <- c(1,2,3)
y <- c(3,6,7)
x+y # 4  8 10
x-y # -2 -4 -4
x*y # 3 12 21
x/y # 0.2000000 0.3333333 0.4285714

### the function union(param, param)
union(x,y) # 1 2 3 5 6 7
setdiff(x,y) # difference of sets == 1 2
intersect(x,y) # 3

