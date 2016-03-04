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
    @articles = TimesArticleDisplayer.new('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=10e123446a9912fe513a27a4278990d7:18:74615897')
    @weather = WeatherDisplayer.new('Boston', 'MA')
    @articles.get_stories
    @weather.get_weather
    erb :dashboard
  end
  get ('/news') do
    @articles = TimesArticleDisplayer.new('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=10e123446a9912fe513a27a4278990d7:18:74615897')
    @weather = WeatherDisplayer.new('Boston', 'MA')
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
