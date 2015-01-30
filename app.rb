require 'sinatra'
require 'pony'
require 'json'
require 'rubygems'
require 'mongoid'

require './booked_clients'

Mongoid.load!("mongoid.yml")

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


post '/sign_up' do


  name=params[:name]
  email=params[:email]
  phone=params[:phone] 
  disclaimer= params[:disclaimer]
  terms= params[:terms]
  amount= params[:amount]
  group = params[:group] 
    

  @dancer=Booked_clients.new(:name => name, :email => email, :phone => phone,  :disclaimer => disclaimer, :terms => terms, :amount => amount, :group => group)
  @dancer.save

  @name=params[:name]
  @email=params[:email]
  @group = params[:group]

    # email words:
    if group=="march_level_1 6:45pm"
      @day = "Thursday 5th March"
    elsif group == "march_level_1 7:45pm"
      @day = "Thursday 5th March"
    else @day = "Friday 5th March"
    end

      puts @day
      @time= @group.split.last
      puts @time
    if settings.environment == :production
      # if we're on heroku, use the sendgrid settings
      require './production_pony_options'
    else
      # otherwise, use our normal email account
      require './development_pony_options'
    end



erb :payment

=begin
 else
    erb :failure 
=end
end

