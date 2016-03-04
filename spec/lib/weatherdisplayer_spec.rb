require 'spec_helper'
require 'dotenv'

describe 'WeatherDisplayer', vcr: true do
  let(:weather){WeatherDisplayer.new('Boston', 'MA')}
  it 'initializes with an empty temperature string' do
    expect(weather.temperature).to eq('')
  end
  it 'initializes with an empty weather string' do
    expect(weather.weather).to eq('')
  end
  it 'initializes with a url' do
    expect(weather.url).to be_a(URI)
    expect(weather.url.host).to eq('api.wunderground.com')
  end
  describe '#get_weather' do
    it 'downloads weather information from the url' do
      weather.get_weather
      expect(weather.temperature).not_to eq('')
      expect(weather.weather).not_to eq('')
    end
  end
end
