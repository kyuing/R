# Natural Language Processing
# - Installing the necessary libraries
# - Basic Tokenization
# - Reading a text file
# - Sentence and Word Annotations
# ref: https://rpubs.com/lmullen/nlp-chapter

# other useful ref: https://youtu.be/lK79KtnbUyE?list=PLRYL8FHwJMhDPF2R2pCe_HwqPt0gaUbvN



# install open nlp
install.packages(c("NLP", "openNLP", "RWeka", "qdap"))

# import it to library
library(NLP)
library(openNLP)
library(RWeka)

# read each line from txt file
# ref: https://github.com/rOpenGov/dh-methods-in-r/blob/master/data/nlp/anb-jarena-lee.txt
bio <- readLines("anb-jarena-lee.txt")
print(bio)

# combine each of the line read by adding a space between them.
bio <- paste(bio, collapse = " ")
print(bio)

# import the following libraries
library(NLP)
library(openNLP)
library(magrittr)

# convert the variable bio to string type
bio <- as.String(bio)

# create annotators for words and sentences
word_ann <- Maxent_Word_Token_Annotator()
sentence_ann <- Maxent_Sent_Token_Annotator()


# create an obj for annotating the text in our bio variable. 
# using the annotate() function, determine where the sentences and words are
bio_annotations <- annotate(bio, list(sentence_ann, word_ann))

# "prints the vector of names of classes an object inherits from"
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/class
# https://www.rdocumentation.org/packages/NLP/versions/0.2-1/topics/Span
class(bio_annotations)


# The object bio_annotations contains a list of sentences
# where an element has a sentence from the text in the object.
# Each element in the list is sorted 
# based on id, type, starting char index, ending char index and constituents.
#
# > head(bio_annotations)
# id type     start end features
# 1 sentence     1 110 constituents=<<integer,20>>
# 2 sentence   112 240 constituents=<<integer,20>>
# 3 sentence   242 386 constituents=<<integer,25>>
# 4 sentence   388 412 constituents=<<integer,6>>
# 5 sentence   414 693 constituents=<<integer,49>>
# 6 sentence   695 791 constituents=<<integer,19>>
head(bio_annotations)

# create an object that will be a plain text 
# but will use the annotated functionality from the obj bio_annotations
# This all is done by the function AnnotatedPlainTextDocument,
# where bio and bio_annotations are parameterized.
bio_doc <- AnnotatedPlainTextDocument(bio, bio_annotations)

# using access functions words() for words and sents() for sentences,
# you can extract the text from the the obj bio_doc

# retrieve 2 sentences with one word unit.
sents(bio_doc) %>% head(2)

# retrieve 10 words with one word unit.
words(bio_doc) %>% head(10)

# To get plain text
as.character(bio_doc)





