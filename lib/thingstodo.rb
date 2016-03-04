class ThingsToDo
  require 'uri'
  require 'json'
  require 'net/http'
  attr_reader :state, :url, :events

  def initialize(state)
    @state = state
    url_string = "https://api.seatgeek.com/2/events?venue.state=#{@state}"
    @url = URI(url_string)
    @events = []
  end

  def get_events
    response = Net::HTTP.get(@url)
    @info = JSON.parse(response)
    @info['events'].each do |stuff|
      @events << stuff['title']
    end

  end
end
