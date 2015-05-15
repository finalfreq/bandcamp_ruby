require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

before do
  @bands = Band.all
  @venues = Venue.all
end

get '/' do
  erb(:index)
end

get '/bands' do
  erb(:bands)
end

post '/bands' do
  band_name = params['band_name']
  @band = Band.new(name: band_name)
  if @band.save
    redirect to '/bands'
  else
    erb(:errors)
  end
end

get '/bands/:id' do
  @band = Band.find(params['id'])
  erb(:band_info)
end

patch '/bands/:id' do
  @band = Band.find(params['id'])
  @band.update(name: params['new_name'])
  redirect to "/bands/#{@band.id}"
end

post '/bands/:id' do
  @band = Band.find(params['id'])
  venues = Venue.find(params['venue_ids'])
  venues.each do |venue|
    @band.venues.push(venue)
  end
  redirect to "/bands/#{@band.id}"
end


delete  '/bands/:id/' do
  Band.delete(params['id'])
  redirect to '/bands'
end

get '/venues' do
  erb(:venues)
end

post '/venues' do
  venue_name = params['venue_name']
  @venue = Venue.new(name: venue_name)
  if @venue.save
    redirect to '/venues'
  else
    erb(:errors)
  end
end

get '/venues/:id' do
  @venue = Venue.find(params['id'])
  erb(:venue_info)
end

post '/venues/:id' do
  @venue = Venue.find(params['id'])
  bands = Band.find(params['band_ids'])
  bands.each do |band|
    @venue.bands.push(band)
  end
  redirect to "/venues/#{@venue.id}"
end
