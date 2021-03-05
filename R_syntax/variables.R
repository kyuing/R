# ref: https://www.rdocumentation.org/
#      https://www.youtube.com/watch?v=eGBy140EuTA
#      https://youtu.be/9C_5T1ums2A
# In R, 
# To declare and initialize  variable,
# run (ctrl + enter) the script on the line.
# if multiple lines, select code blocks 
# and then run (ctrl + enter) the script

"hello"
'hello'
1
1.1
F
Sys.Date()
Sys.time()

# string
sayhello <- "hello world"
sayhello # print

# int
int_num <- 1
int_num

# double
double_num <- 0.087675
double_num

# boolean
isTrue <- T
isTrue

isFalse <- F
isFalse

# vector: MUST BE THE SAME DATA TYPE!
string_vector <- c("one", "two", "three")
string_vector

num_vector <- c(1, 2, 3)
num_vector

logical_vector <- c(T, F, T, F, T)
logical_vector

# mauual sequence of nums using a vector
c_oneToFive <-  c(1,2,3,4,5)
c_oneToFive

# seq() generates a sequence of numbers
seqOneToFive <- seq(1,5) 
seqOneToFive

# a sequence of numbers with a colon
colon_oneToFive <- 1:5
colon_oneToFive


### seq() function ### 
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/seq

# seq(from, to)
# by == increment of the sequence.
# 1+5 = 6
# 6+5 = 11
# ...
seqBy <- seq(1,20, by=5)
seqBy

# seq(from, to, length.out= )
# length.out ==  equally spaced values from from to to.
seqLengthOut <-seq(1,20, length.out=5)
seqLengthOut

### rep() function ###
i <- seq(1,5)

# for 1 to 5 then repeat all 3 times
rep(i, times = 3) # it's like a For-loop in other languages.

# for 1 to 5 then repeat each of nums 3 times in order.
rep(i, each = 3) # NOT like a For-each in other languages.


### index in vector ###
v <- c("one","two","three","four","five")

# To get 4th value in a vector or array,
# specify the index num. 
# (in R, index starts from 1, not from 0)
v[3]


# To get more than one value in a vector or array,
# call the combine function with index nums in it.
v[c(3,5)] # "three" "five" 

# To get a sequence of nums,
# specify the index nums separated by a colon.  
v[3:5] # "three" "four"  "five" 





