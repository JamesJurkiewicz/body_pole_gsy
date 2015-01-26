#require 'sinatra'
#require 'pony'
#require 'json'
require 'rubygems'
#require 'mongoid'

#require './booked_clients'


#Mongoid.load!("mongoid.yml")


get '/'  do
  erb :index
end


get '/test' do
  erb :test3
end

get '/pole_and_fitness' do
  erb :pole_and_fitness
end

get '/index'  do
  erb :index
end


get '/about_us'  do
  erb :about_us
end

get '/location'  do
  erb :location
end

get '/classes'  do
  erb :classes
end

get '/instructors'  do
  erb :instructors
end

get '/information' do 
  erb :information
end

get '/disclaimer' do 
  erb :disclaimer
end

get '/party' do 
  erb :party
end

get '/conditions' do 
  erb :conditions
end

get '/sign_up'  do

#@signups= Booked_clients.all

  #   puts @jan_1
  # @dancers= Booked_clients.all

  erb :sign_up
end

get '/contact'  do
  erb :contact
end

get '/gallery'  do
  erb :gallery
end

get '/sign_in'  do
  erb :sign_in
end