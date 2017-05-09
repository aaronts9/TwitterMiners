setwd("YOUR WORKING DIRECTORY")


#read in CSV file where search tweet data frame was written to
rawDF = read.csv(file="newCleanSEAtweets.csv")

# clean text using vector

# remove retweet entities
rawDF$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", rawDF$text)
# remove at people
rawDF$text = gsub("@\\w+", "", rawDF$text)
# remove punctuation
rawDF$text = gsub("[[:punct:]]", "", rawDF$text)
# remove numbers
rawDF$text = gsub("[[:digit:]]", "", rawDF$text)
# remove html links
rawDF$text = gsub("http\\w+", "", rawDF$text)
# remove unnecessary spaces
rawDF = total

rawDF$text = gsub("^\\s+|\\s+$", "", rawDF$text)
#remove / and /n



#remove UTF-* encoding's
#method 1
iconv(rawDF$text,to="ASCII//TRANSLIT")
#method 2
unwanted_array = list(    'S'='S', 's'='s', 'Z'='Z', 'z'='z', '?'='A', '?'='A', '?'='A', '?'='A', '?'='A', '?'='A', '?'='A', '?'='C', '?'='E', '?'='E',
                          '?'='E', '?'='E', '?'='I', '?'='I', '?'='I', '?'='I', '?'='N', '?'='O', '?'='O', '?'='O', '?'='O', '?'='O', '?'='O', '?'='U',
                          '?'='U', '?'='U', '?'='U', '?'='Y', '?'='B', '?'='Ss', '?'='a', '?'='a', '?'='a', '?'='a', '?'='a', '?'='a', '?'='a', '?'='c',
                          '?'='e', '?'='e', '?'='e', '?'='e', '?'='i', '?'='i', '?'='i', '?'='i', '?'='o', '?'='n', '?'='o', '?'='o', '?'='o', '?'='o',
                          '?'='o', '?'='o', '?'='u', '?'='u', '?'='u', '?'='y', '?'='y', '?'='b', '?'='y' )

for(i in seq_along(unwanted_array))
  rawDF$text <- gsub(names(unwanted_array)[i],unwanted_array[i],rawDF$text)

#method 3
chartr(paste(names(unwanted_array), collapse=''),
       paste(unwanted_array, collapse=''),
       rawDF$text)

rawDF$text = gsub("?","", rawDF$text)
rawDF$text[17916]


#tokenize words - i.e. split sentence into 
library(stringr)
#initialize vector for words to go into for every sentence
v = c()
#initialize data frame to store vectors in
df = data.frame()
for(tweet in rawDF$text) {
  #split tweet up by " "
  v = str_split(tweet, " ")
  # unlist resulting list and append as data frame
  df = rbind(df, as.data.frame(unlist(v)))
}

#write to CSV
write.csv(df,file="YOURFILE")
