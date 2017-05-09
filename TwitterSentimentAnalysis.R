setwd("YOUR WORKING DIRECTORY")

#input dataframes/csv files
df = read.csv("YOURFILE.csv")


#Calculate sentiments based on RSentiment

library(RSentiment)
df$score = calculate_score(df)
df$classification = calculate_sentiment(df$text)

# sentence sentiment
#initialize data frame to store sentence scores in
score = data.frame()
for (tweet in df$unlist.v.) {
  #store sentence sentiment in data frame
  sentimentDF = data.frame(tweet,calculate_sentiment(tweet))
  #append to total
  score = rbind(score,sentimentDF)
}



#write to CSV
write.csv(score,file="")
