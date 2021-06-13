install.packages('wordcloud')
install.packages('RColorBrewer') 
# install.packages('KoNLP') # For Korean 
# install.packages('SnowballC')
# install.packages('wordcloud2')
# install.packages('plyr') 
# install.packages('stringr') 
# install.packages('ggplot2')


library(wordcloud) 
library(RColorBrewer) 
# library(KoNLP) 
# library(SnowballC) 
# library(wordcloud2) 
# library(plyr) 
# library(stringr) 
# library(ggplot2)


#load file 
data <- read.csv("regional-global-daily-latest-11062021.csv", header=TRUE, sep=",", encoding="UTF-8") 


# extract artist names only
artist <- data[,c("X.2")] # auto generated colunm X.2 == Artist column
artist

#########################
# parsed <- unlist(artist)
# parsed
########################

# sort artist in ASC and exclude the column name
# (When the csv file was read, the actual column name "Artist" 
# is set to be the first value of the auto-generated column "X.2")
sorted <- sort(artist)[2:201]
# sorted <- sort(artist, decreasing=T)[2:201] # sort artist in descending
sorted

# Create table data with sorted
table <- table(sorted)
table

# Create data.frame from table 
df <- data.frame(table)
df

# Change column name 
names(df) <- c("artist", "freq")
df

####################################
# not in use.
# Extract N items from head top N. 
# topN <- head(df, 200) 
###################################

# Set a random seed for some random visualization
set.seed(1)

# visualize
wordcloud(
  words=df$artist, 
  freq=df$freq, 
  min.freq = 1, 
  max.words = 200,
  scale=c(2,0.2),
  random.order=FALSE, 
  rot.per = .1,
  colors=brewer.pal(8, "Dark2"),
  )



# refs
# https://spotifycharts.com/regional/global/daily/latest
# https://arclab.tistory.com/105
# https://lsjsj92.tistory.com/217
# https://www.rdocumentation.org/packages/wordcloud/versions/2.6/topics/wordcloud
# https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html
