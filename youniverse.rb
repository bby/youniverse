require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'sinatra'
require 'sinatra/reloader' if development?
require 'httparty'
require 'json'

configure :production do
	
end

configure :development do
end


get '/' do
  erb :home
end

get '/latest_photos.json' do

	content_type :json
	response = HTTParty.get('https://api.instagram.com/v1/users/4208369/media/recent/?client_id=a69431b34b9e434daea6720f08a21721&min_id=773657111806913249')
	response.to_json

end