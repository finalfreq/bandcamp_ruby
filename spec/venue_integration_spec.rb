require 'spec_helper'

describe 'venue creation and update process', type: :feature do

  it 'has a link to all venues page from home page' do
    visit '/'
    click_on 'add a venue'
    expect(page).to have_content('Houses of Rock')
  end

  it 'sends form data, creates venue' do
    visit '/venues'
    fill_in 'venue_name', with: 'The gorge'
    click_on 'Add Venue'
    expect(page).to have_content('The Gorge')
  end
end
