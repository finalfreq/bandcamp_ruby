require 'spec_helper'

describe Venue do
  it {should have_and_belong_to_many :bands }

  it 'will change the name to title case when saved' do
    venue = Venue.create(name: "the gorge")
    expect(venue.name).to(eq("The Gorge"))
  end

end
