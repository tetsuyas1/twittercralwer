require 'rubygems'
require 'bundler/setup'

require "twitter"
require 'json'

file = File.read('twitter_secrets.json')
data_hash = JSON.parse(file)

TWITTER = Twitter::REST::Client.new do |config|
  config.consumer_key        =  data_hash['CONSUMER_KEY']
  config.consumer_secret     =  data_hash['CONSUMER_SECRECT']
  config.access_token        =  data_hash['ACCESS_TOKEN']
  config.access_token_secret =  data_hash['ACCESS_TOKEN_SECRECT'] 
end

def rate_limited_user_timeline (user)
  num_attempts = 0
  begin
    num_attempts += 1
    TWITTER.user_timeline(user,count:10000)
  rescue Twitter::Error::TooManyRequests => error
    if num_attempts % 3 == 0
      sleep(15*60) # minutes * 60 seconds
      retry
    else
      retry
    end
  end
end

def rate_limited_status(id)
	num_attempts = 0
  begin
    num_attempts += 1
    TWITTER.status(id)
  rescue Twitter::Error::TooManyRequests => error
    if num_attempts % 3 == 0
      sleep(15*60) # minutes * 60 seconds
      retry
    else
      retry
    end
  end
end	