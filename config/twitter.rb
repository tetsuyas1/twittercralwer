require 'rubygems'
require 'bundler/setup'

require "twitter"
require 'json'
file = File.read('twitter_secrets.json')
data_hash = JSON.parse(file)

@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        =  data_hash['CONSUMER_KEY']
  config.consumer_secret     =  data_hash['CONSUMER_SECRECT']
  config.access_token        =  data_hash['ACCESS_TOKEN']
  config.access_token_secret =  data_hash['ACCESS_TOKEN_SECRECT'] 
end

def user_timeline(user_id)
    @twitter.user_timeline(user_id,count:20)
end
