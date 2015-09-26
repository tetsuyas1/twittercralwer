Dir[File.dirname(__FILE__) + '/config/*.rb'].each {|file| require file }

user_timeline(34576014).each do |timeline|
  	puts @twitter.status(timeline.id).text
end
