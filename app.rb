require 'sinatra'
require 'pony'
require 'mongoid'
require 'json'

require './person'
#if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
#  require './production_pony_options'
#else
  # otherwise, use our normal email account
#  require './development_pony_options'
#end

# Setup database connection
Mongoid.load!("mongoid.yml")

get '/'  do
  erb :index
end

get '/homepage' do
	erb:homepage
end

get '/sponsorship' do
	erb:sponsorship
end

get '/the_ball' do
	erb:the_ball
end

get '/index' do
	erb:index
end

get '/tickets' do
	erb:tickets
end

get '/table_plan' do
	erb:table_plan
end


post '/table_plan' do

@diner=Person.new

	@diner.save
	
erb:table_plan

end




	