require 'sinatra'
#require 'pony'
#require 'json'
require 'rubygems'
#require 'mongoid'

#require './booked_clients'


#Mongoid.load!("mongoid.yml")


get '/'  do
  erb :index
end
