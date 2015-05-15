require 'spec_helper'

describe Band do

  it {should have_and_belong_to_many :venues }

  it 'will change the name to title case when saved' do
    band = Band.create(name: "biG fiSH")
    expect(band.name).to(eq("Big Fish"))
  end

end
