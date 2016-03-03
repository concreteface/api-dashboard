require 'uri'
require 'net/http'
require 'json'


url2 = URI('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=10e123446a9912fe513a27a4278990d7:18:74615897')
response = Net::HTTP.get(url2)
res2 = response
@info2 = JSON.parse(res2)
# headlines = []
# info2.values[5].each do |info|
#   headlines += info['title']
# end
headlines = []
@info2.values[5].each do |info|
  headlines << info['title']
end
puts headlines
