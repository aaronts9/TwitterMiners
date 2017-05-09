'''
Created on Mar 2, 2017

@author: AaronLum
'''
import sys
import tweepy
import csv

#pass security information to variables
consumer_key =    #   YOUR KEY
consumer_secret = #   YOUR SECRET
access_key =      #   YOUR KEY
access_secret =   #   YOUR SECRET


#use variables to access twitter
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_key, access_secret)
api = tweepy.API(auth)

#create an object called 'customStreamListener'

class CustomStreamListener(tweepy.StreamListener):
    def on_status(self, status): 
        '''RENAME FILE EVERY TIME AND ALSO TRACK FILTER'''
        '''Parameter'a' may need to be changed to 'wb' if python 2.7 and back to 'a' if python 3'''
        with open('YOURCSV.csv', 'a') as f: 
            writer = csv.writer(f)
            print(status.text)
            writer.writerow([status.author.screen_name.encode('utf-8').strip(), status.created_at, status.text.encode('utf-8').strip()])

    def on_error(self, status_code):
        print >> sys.stderr, 'Encountered error with status code:', status_code
        return True # Don't kill the stream

    def on_timeout(self):
        print >> sys.stderr, 'Timeout...'
        return True # Don't kill the stream


streamingAPI = tweepy.streaming.Stream(auth, CustomStreamListener())
'''RENAME TRACK FILTER'''
streamingAPI.filter(track=['YOUR TERM'], languages= ['en'])
