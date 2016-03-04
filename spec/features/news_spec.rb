require 'spec_helper'

feature 'news', vcr:true do
  # As a user, I want to see headlines below a news heading.
  scenario 'users see the news heading' do
    visit '/news'
    expect(page).to have_content('News')
  end
end
