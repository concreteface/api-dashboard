class TimesArticleDisplayer
  attr_reader :headlines, :url
  require 'uri'
  require 'net/http'
  require 'json'
  def initialize(url)
    @url = URI(url)
    @headlines = []
    @response = Net::HTTP.get(@url)
    @articles = JSON.parse(@response)
  end

  def get_stories
    @articles.values[5].each do |article|
      @headlines << article['title']
    end
  end
end
