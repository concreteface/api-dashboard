require 'spec_helper'

feature 'weather', vcr:true do
  # As a user, I want to see the day's weather below a heading.
  scenario 'users see the weather heading' do
    visit '/weather'
    expect(page).to have_content('Weather')
  end
end
