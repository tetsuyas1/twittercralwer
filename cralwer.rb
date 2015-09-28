Dir[File.dirname(__FILE__) + '/config/*.rb'].each {|file| require file }
require 'pry-byebug'

file = File.new("config/test", "r")

while (line = file.gets)

	name = line.gsub( /\r\n/m, "\n" )
	fjson = File.new("tweets/#{name}.json", "w")
	hash = []
	flag = 0

	(1..16).each do |page|
		
		rate_limited_user_timeline(line,page).each do |tweet|

			@twitter = rate_limited_status(tweet.id)

			if @twitter.created_at.year < 2013
				flag = 1 
				break
			end	

			# break if @twitter.created_at.year < 2013

			tempHash = {
	    		"status" => @twitter.full_text,
	    		"fav_count" => @twitter.favorite_count.to_s,
	    		"retweet_count" => @twitter.retweet_count.to_s,
	    		"created_at" => @twitter.created_at.to_s
			}

			hash << tempHash

		end

		break if flag == 1

	end	

	fjson.write(JSON.pretty_generate(hash))
	fjson.close

end

file.close