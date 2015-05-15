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
