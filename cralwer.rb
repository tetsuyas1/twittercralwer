Dir[File.dirname(__FILE__) + '/config/*.rb'].each {|file| require file }
require 'pry-byebug'

file = File.new("config/authers", "r")

while (line = file.gets)
	user_timeline(line).each do |timeline|

		# puts "name: #{line}"
		puts "{"
	  	puts "status :" + TWITTER.status(timeline.id).full_text
	  	puts "fav_count:" + TWITTER.status(timeline.id).favorite_count.to_s
	  	puts "retweet_count:" + TWITTER.status(timeline.id).retweet_count.to_s
	  	puts "created_at:" + TWITTER.status(timeline.id).created_at.to_s
	  	puts "}"

	end
end

file.close