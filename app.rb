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

@signups= Booked_clients.all

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

=begin

    @diner=Booked_clients.new(:name => name)
    @diner.save
=end


 # if params[:disclaimer]= "confirmed"
    # classes = params[:class] 
    # name=   params[:name].split.first.capitalize
    # email=  params[:email]
    # level=  params[:class].split[2]
    # date=   params[:class].split.first
    # phone= params[:phone]
    # disclaimer= params[:disc]
    # terms= params[:terms]
    # amount= params[:amount]

    # @dancer=Booked_clients.new(:name => name, :email => email, :class => classes, :phone => phone, :disclaimer => disclaimer, :terms => terms, :amount => amount)
    # @dancer.save

=begin

    if params[:class].split[2]=1
      @cost=85
    else
      @cost=92
    end=end

  
    @dancer=Booked_clients.new(:name => name, :email => email, :class => classes, :phone => phone, :disclaimer => disclaimer, :terms => terms, :amount => amount)
    @dancer.save

    # email words:
    if @classes=="jan lvl 1 6:45pm"
      @day = "Thursday 5th March"
    elsif @classes == "jan lvl 1 7:45pm"
      @day = "Thursday 5th March"
    else @day = "Friday 5th March"
    end

      puts @day
      @time= @classes.split.last
      puts @time
    if settings.environment == :production
      # if we're on heroku, use the sendgrid settings
      require './production_pony_options'
    else
      # otherwise, use our normal email account
      require './development_pony_options'
    end

    Pony.mail(
      :to => @email,
      :subject => "Body and Pole Guernsey confirmation",
      :body => erb(:email, :layout => false),
    # :bcc => anneka@...
      :attachments => {"H&F_Declaration.docx" => File.read("public/H&F_Declaration.docx"),"Information_sheet.pdf" => File.read("public/Information_sheet.pdf"),"Information_sheet_level_2.pdf" => File.read("public/Information_sheet_level_2.pdf"),

        },

      :via => 'smtp',
      :from => 'Body & Pole Limited',
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'bodyandpole.gsy@gmail.com',
        :password             => '9carryonbrynn99',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    })

=end
  erb :thankyou

=begin
 else
    erb :failure 
=end
 

  
end