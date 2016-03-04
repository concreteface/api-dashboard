require 'spec_helper'

feature 'events', vcr:true do
  #As a user, I want to see a list of the day's events below a heading
  scenario 'users see the events heading' do
    visit '/events'
    expect(page).to have_content('Events')
  end
end
