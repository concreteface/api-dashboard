require 'spec_helper'

describe 'TimesArticleDisplayer', vcr: true do
  let(:articles){TimesArticleDisplayer.new('http://api.nytimes.com/svc/topstories/v1/home.json?api-key=10e123446a9912fe513a27a4278990d7:18:74615897')}
  it 'has an array of headlines' do
    expect(articles.headlines).to be_a(Array)
    expect(articles.headlines.empty?).to eq(true)
  end
  it 'initializes with a url' do
    expect(articles.url).to be_a(URI)
    expect(articles.url.host).to eq('api.nytimes.com')
  end

  describe '#get_stories' do
    it 'populates the headlines array with headlines' do
      articles.get_stories
      expect(articles.headlines.empty?).to eq(false)
      expect(articles.headlines[0]).to be_a(String)
    end
  end

end
