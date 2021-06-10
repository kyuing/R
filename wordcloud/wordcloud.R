install.packages("wordcloud2")
library(wordcloud2)
# Sys.setlocale("LC_ALL", "en_US.UTF-8")
# wordcloud2(data = demoFreq)


# read each line from txt file
words <- readLines("Google Year in Search 2020.txt", encoding="UTF-8")
# bio <- unlist(bio)
# bio <- as.String(bio)
print(words)


# if necessary to replace some words, use gsub function
# replaceWords <- gsub("pattern", "replacement", target variable)

# return the variable words as an unlisted data frame
toReturn <- table(unlist(data.frame(words)))
toReturn


# visualize 
wordcloud2(toReturn, size = 1, color = "random-light", backgroundColor = "grey")




# refs
# https://rpubs.com/lmullen/nlp-chapter
# https://youtu.be/6UNOktF4ToU?list=PLRYL8FHwJMhDPF2R2pCe_HwqPt0gaUbvN
# https://datacookbook.kr/10
# https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html
# https://trends.google.com/trends/yis/2020/GLOBAL/
# https://arclab.tistory.com/105


