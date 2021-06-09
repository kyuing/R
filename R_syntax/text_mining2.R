# Natural Language Processing
# - Annotating people and places
# ref: https://rpubs.com/lmullen/nlp-chapter

# other useful ref: https://youtu.be/lK79KtnbUyE?list=PLRYL8FHwJMhDPF2R2pCe_HwqPt0gaUbvN



# install open nlp
install.packages(c("NLP", "openNLP", "RWeka", "qdap"))
install.packages("openNLPmodels.en",
                 repos = "http://datacube.wu.ac.at/",
                 type = "source")


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

# NER(named entity recognition) provides various named entity such as
# dates, locations, money, organizations, percentages, people, and times.
# (acceptable values are 
# "date", "location", "money", "organization", "percentage", "person", "misc")

# create annotator obj for word, sentence, person, location and organization,
# using the constructor Maxent_Entity_Annotator()
word_ann <- Maxent_Word_Token_Annotator()
sent_ann <- Maxent_Sent_Token_Annotator()
person_ann <- Maxent_Entity_Annotator(kind = "person")
location_ann <- Maxent_Entity_Annotator(kind = "location")
organization_ann <- Maxent_Entity_Annotator(kind = "organization")

# create a pipeline that holds each of the annotator obj above.
pipeline <- list(sent_ann,
                 word_ann,
                 person_ann,
                 location_ann,
                 organization_ann)

#create an obj that holds the source bio and annotators in the list of the pipeline
bio_annotations <- annotate(bio, pipeline)

# produce an AnnotatedPlainTextDocument with the source bio and the obj bio_annotations
bio_doc <- AnnotatedPlainTextDocument(bio, bio_annotations)

# function to extract named entities from AnnotatedPlainTextDocument
# error solved by 
# https://stackoverflow.com/questions/55371738/has-the-method-annotations-in-rnlp-package-been-deprecated-or-replaced
entities <- function(doc, kind) {
  s <- doc$content  # s takes content in doc
  # print(s)

  # a <- annotations(doc)[[1]]  # not working
  a <- annotation(doc)   # a holds all the annotated info from the param doc
  # print(a)
  
  if(hasArg(kind)) {
    
    # the following two lines of codes checks
    # if the value of the field features in the local variable a is equals to 
    # the value of the parameter kind.
    k <- sapply(a$features, `[[`, "kind")
    s[a[k == kind]]
    # print(k)
    
  } else {
    s[a[a$type == "entity"]]
  }
}

# call the function entities passing bio_doc and named entity type
# each of params
entities(bio_doc, kind = "person")
entities(bio_doc, kind = "location")
entities(bio_doc, kind = "organization")

