require "./lib/geolocation"
require "./lib/timesarticledisplayer"
require "./lib/weatherdisplayer"
require "./lib/thingstodo"
require "sinatra/base"
require 'uri'
require 'net/http'
require 'json'
require 'pry'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end
  get ('/news') do
    @key=ENV["TIMES_KEY"]
    @articles = TimesArticleDisplayer.new("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{@key}")
    @articles.get_stories
    erb :news
  end
  get ('/weather') do
    @weather = WeatherDisplayer.new('Boston', 'MA')
    @weather.get_weather
    erb :weather
  end
  get ('/events') do
    @events = ThingsToDo.new('MA')
    @events.get_events
    erb :events
  end

end
