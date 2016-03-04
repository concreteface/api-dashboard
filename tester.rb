require 'uri'
require 'net/http'
require 'json'


url = URI('https://api.seatgeek.com/2/events?venue.state=CA')
response = Net::HTTP.get(url)
@info = JSON.parse(response)
@info['events']

@info['events'].each do |stuff|
  puts stuff['title']
end
