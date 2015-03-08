require 'sinatra'
require 'pony'
require 'json'
require 'rubygems'
require 'mongoid'

require './booked_clients'
require './parties'

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

  @name=params[:name]
  @email=params[:email]
  @group = params[:group]

    # email words:
    if group=="april_level_1 6:30pm"
      @day = "Thursday 30th April"
      @amount=85.00
      @level= "1"
    elsif group == "april_level_2 7:45pm"
      @day = "Thursday 30th April"
      @amount=85.00 
=begin
    elsif group == "march_choreography 6:45pm"
      @day = "Friday 6th March"
      @amount = 92.00
      @level= "2 and above choreography"
    else 
      @day = "Friday 6th March"
      @amount=92.00
      @level= "2"
=end

    end

    @dancer=Booked_clients.new(:name => name, :email => email, :phone => phone,  :disclaimer => disclaimer, :terms => terms, :amount => @amount, :group => group)
    @dancer.save

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

    if @amount == 85.00
      Pony.mail(
      :to => @email,
      :subject => "Body and Pole Guernsey confirmation",
      :body => erb(:email, :layout => false),
    # :bcc => anneka@...
      :attachments => {"Pole Fitness and Health and Safety declaration.pdf" => File.read("public/Pole Fitness and Health and Safety declaration.pdf"),"Information_Sheet_Body_Pole_LVL_1.pdf" => File.read("public/Information_Sheet_Body_Pole_LVL_1.pdf"),"Disclaimer.pdf" => File.read("public/Disclaimer.pdf"),

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

    elsif @level== "2 and above choreography"
      Pony.mail(
      :to => @email,
      :subject => "Body and Pole Guernsey confirmation",
      :body => erb(:email, :layout => false),
    # :bcc => anneka@...
      :attachments => {"Pole Fitness and Health and Safety declaration choreography.pdf" => File.read("public/Pole Fitness and Health and Safety declaration choreography.pdf"),"Information Sheet Body Pole Choreography.pdf" => File.read("public/Information Sheet Body Pole Choreography.pdf"),"Disclaimer choreography.pdf" => File.read("public/Disclaimer choreography.pdf"),

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

    else 
         Pony.mail(
      :to => @email,
      :subject => "Body and Pole Guernsey confirmation",
      :body => erb(:email, :layout => false),
    # :bcc => anneka@...
      :attachments => {"Pole Fitness and Health and Safety declaration.pdf" => File.read("public/Pole Fitness and Health and Safety declaration.pdf"),"Information_Sheet_Body_Pole_LVL_2.pdf" => File.read("public/Information_Sheet_Body_Pole_LVL_2.pdf"),"Disclaimer.pdf" => File.read("public/Disclaimer.pdf"),

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
    end

erb :payment

post '/party' do
  if params[:disclaimer]= "confirmed"
    @groups = params[:group] 
    @name=   params[:name].split.first.capitalize
    @email=  params[:email]
    @date=   params[:date]

    if params[:party]="5 people"
      @cost=125
    else
      @cost=200
    end


    name=params[:name]
    email=params[:email]
    phone=params[:phone] 
    disclaimer= params[:disclaimer]
    terms= params[:terms]
    group = params[:group] 
    spa= params[:spa]
      

    @party=Parties.new(:name => name, :email => email, :phone => phone,  :disclaimer => disclaimer, :terms => terms, :amount => @cost, :group => group, :spa => spa) 
    @party.save


    Pony.mail(
      :to => @email,
      :subject => "Body and Pole Gsy party confirmation",
      :body => erb(:email_party, :layout => false),
    # :bcc => anneka@...
      :attachments => {"H&F_Declaration.docx" => File.read("public/H&F_Declaration.docx")},
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
    erb :thankyou_party

  else 
    erb :no_disclaimer
  end
end

post '/contact' do
  @classes = params[:class] 
  @name=   params[:name]
  @email=  params[:email]
  @subject=  params[:subject]
  @message=  params[:message]

  Pony.mail(
    :to => @email,
    :subject => "Body & Pole Gsy contact received",
    :body => erb(:contact_email, :layout => false),
    :bcc => 'bodyandpole.gsy@gmail.com',
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

  erb=end
 :contact_thankyou
end
end

