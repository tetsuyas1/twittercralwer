require 'rubygems'
require 'bundler/setup'

require "twitter"

@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = "tfUBB6aOCHbveWXsHddYyDY8g"
  config.consumer_secret     = "ffB9fv5NK0ByqNOHUeYZNQM7KwcbKhPrNM7iVhVINPiyLSPh9r"
  config.access_token        = "201754724-F2yQ83rqDQum72rGmHdFr3xP0dbl4QN21BqsD1wA"
  config.access_token_secret = "LQ0mdgWIB4H57Too7IhDA9m5eOp6IxaNDvt1lPecMs6X6"
end

def user_timeline(user_id)
    @twitter.user_timeline(user_id,count:20)
end
