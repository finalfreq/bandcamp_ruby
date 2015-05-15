require 'spec_helper'

describe Band do

  it {should have_and_belong_to_many :venues }

  it 'will change the name to title case when saved' do
    band = Band.create(name: "biG fiSH")
    expect(band.name).to(eq("Big Fish"))
  end

  it 'validates if a name was entered' do
    band = Band.new(name: '')
    expect(band.save).to(eq(false))
  end
end
