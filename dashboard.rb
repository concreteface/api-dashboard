require "./lib/geolocation"
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

end
