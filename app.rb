require 'sinatra'
require 'pony'
require 'json'
require 'rubygems'
require 'mongoid'

require './booked_clients'
#require './person'

Mongoid.load!("mongoid.yml")


get '/'  do
  erb :index
end
