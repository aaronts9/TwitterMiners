setwd("c:/Users/Aaron/Dropbox/#VizzingCl")
setwd("/Users/AaronLum/Dropbox/#VizzingCl")


#twitter login stuff
library(twitteR)
library(ROAuth)
consumer_key <- "YlxV0TG53oLZaRD4OXD1tJDv3"
consumer_secret <- "Vsc17DzrqCN0JGhyKcXNp0fNGacQRlotunmchR8OoiHeZ4Wa0T"
access_token <- NULL
access_secret <- NULL
setup_twitter_oauth(consumer_key = consumer_key,
                    consumer_secret = consumer_secret,
                    access_token = access_token,
                    access_secret = access_secret)

#search twitter for things
  #initilialize final data frame
total = data.frame()
i = 1
while (i < 23) {
  #searchTwitter(x =searchText, n = number, lang = language, since = starting date, until = ending date, geocode = location in coordinates)
  dtsc <- searchTwitter("#climatechange", "#Seattle"
                        ,n=2000, lang = "en", 
                        since = paste("2017-02-",toString(i), sep=""), 
                        until = paste("2017-02-",toString(i+1), sep=""))
  #save search results as data frame
  df <- do.call("rbind", lapply(dtsc, as.data.frame))
  #tack on new data frame to bottom of total
  total = rbind(total,df)
  i = i + 1
}

#output dataframe to csv
write.csv(rawDF,file="")

#Using Yahoo!, Where on Earth ID, trends in Seattle
trends.df =getTrends(2490383)

