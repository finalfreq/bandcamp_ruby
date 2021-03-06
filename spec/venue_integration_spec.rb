require 'spec_helper'

describe 'venue creation and update process', type: :feature do

  it 'has a link to all venues page from home page' do
    visit '/'
    click_on 'Add and View Venues'
    expect(page).to have_content('Houses of Rock')
  end

  it 'sends form data, creates venue' do
    visit '/venues'
    fill_in 'venue_name', with: 'The gorge'
    click_on 'Add Venue'
    expect(page).to have_content('The Gorge')
  end

  it 'can add bands to venue from venue page' do
    band = Band.create(name:"final frequency")
    venue = Venue.create(name:"the gorge")
    visit "/venues/#{venue.id}"
    check "#{band.name}"
    click_on "Add Bands"
    expect(page).to have_content('The Gorge has had the pleasure of bringing the following bands: Final Frequency ')
  end
end
