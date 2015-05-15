require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

before do
  @bands = Band.all
  @venues = Venue.all
end

get '/' do

end

get '/bands' do


end

get '/bands/:id' do

end
