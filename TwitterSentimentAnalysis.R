setwd("c:/Users/Aaron/Dropbox/#VizzingCl")

#input dataframes/csv files
seattle = read.csv("SEAWords.csv")
world = read.csv("WORLDWords.csv")


#Calculate sentiments based on RSentiment

library(RSentiment)
seattle$score = calculate_score(seattle$text)
score = calculate_score(seattle$text)
seattle$classification = calculate_sentiment(seattle$text)
world$score = calculate_score(world)
world$classification = calculate_sentiment(world$text)

# sentence sentiment
#initialize data frame to store sentence scores in
score = data.frame()
for (tweet in world$unlist.v.) {
  #store sentence sentiment in data frame
  sentimentDF = data.frame(tweet,calculate_sentiment(tweet))
  #append to total
  score = rbind(score,sentimentDF)
}



#write to CSV
write.csv(score,file="")
