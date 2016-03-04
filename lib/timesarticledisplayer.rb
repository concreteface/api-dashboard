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
# articles = TimesArticleDisplayer.new('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=10e123446a9912fe513a27a4278990d7:18:74615897')
# articles.get_stories
# articles.headlines.each do |headline|
#   puts headline
# end
