require 'spec_helper'

describe 'band creation and update process', type: :feature do

  it 'has a link to all bands page from home page' do
    visit '/'
    click_on 'add a band'
    expect(page).to have_content('Rockstars')
  end

  it 'sends form data, creates band' do
    visit '/bands'
    fill_in 'band_name', with: 'final frequency'
    click_on 'Add Band'
    expect(page).to have_content('Final Frequency')
  end

  it 'can change name of band' do
    band = Band.create(name:"final frequncy")
    visit "/bands/#{band.id}"
    fill_in 'new_name', with: "morgan paige"
    click_on 'Update Band'
    expect(page).to have_content('Morgan Paige')
  end

  it 'can delete the band' do
    band = Band.create(name:"final frequncy")
    visit "/bands/#{band.id}"
    click_on 'Destroy Band'
    expect(page).to have_no_content('Final Frequency')
  end
end
