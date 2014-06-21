require 'sinatra'
require 'mongoid'
require 'pony'
require 'json'
require 'rubygems'
require 'google_drive'

 require './person'

# Setup database connection
Mongoid.load!("mongoid.yml")
#Person.destroy_all
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

get '/contact' do
	erb:contact
end

get '/table_plan' do
 # table_number=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
  #table_number.each do |a|
    #a=a.string
   # @table=Person.where(:table=>"a") 
   # puts @table
  #end
  @table= Person.all
	erb:table_plan
end

get '/ticket_form' do
  erb:ticket_form
end


post '/table_plan' do

  name=params[:name]
  table_number=params[:table]
  @table_number=table_number.to_s

  if Person.where(:table => table_number).count == 12
    @table_number=table_number.to_s
  erb:table_plan_fail

  else
    @diner=Person.new(:name => name, :table => table_number)
    @diner.save
    erb:table_plan_success
  end
  #table_number=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
  #table_number.each do |a|
    #a=a.string
  #end
end

if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
  require './production_pony_options'
else
  # otherwise, use our normal email account
  require './development_pony_options'
end

post '/ticket_form' do

  ticket = {'name' => params[:name], 'email' => params[:email], 'college' => params[:college], 'tickets' => params[:tickets], 'status' => params[:status], 'age' => params[:age], 'ref_num' => rand(1000000)}
  puts ticket
    if ticket['tickets']=="1"
      @ticket_text= 'a ticket'
     # @cost="260"
    else 
      @ticket_text= 'tickets'
     # @cost= "130"
    end

  puts @ticket_text
    @cost= (130*ticket['tickets'].to_i).to_s
    @name= ticket['name'].split.first.capitalize
    @reference = ticket['ref_num'].to_s

    # Logs in.
    # You can also use OAuth. See document of
    # GoogleDrive.login_with_oauth for details.
    session = GoogleDrive.login("james.jurkiewicz12@gmail.com", "JboSelect1")

    # First worksheet of
    # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
    ws = session.spreadsheet_by_key("0AtqrFUvZahtHdDZtU2ZPb2JLM1FWT2xEMXMwWmxtWlE").worksheets[0]

    # Dumps all cells.
    for row in ws.num_rows+1..ws.num_rows+1
      for col in 1..ws.num_cols
       ws[row, 1]= ticket["name"]
       ws[row, 2]= ticket["email"]
       ws[row, 3]= ticket["college"]
       ws[row, 4]= ticket["tickets"]
       ws[row, 5]= ticket["status"]
       ws[row, 6]= ticket["age"]
       ws[row, 7]= ticket["ref_num"]
       ws[row, 8]= "=getDateandTime()"
      end
    end
    ws.save

    if ws.num_rows<=133
    
      Pony.mail( :to => ticket['email'],
            :bcc => "administrator@bridgeofsighsball.co.uk",
            :subject => "Bridge of Sighs confirmation email",
            :body => erb(:email, :layout => false)   )
    else
      Pony.mail( :to => ticket['email'],
            :bcc => "administrator@bridgeofsighsball.co.uk",
            :subject => "Bridge of Sighs confirmation email",
            :body => erb(:email_reserve, :layout => false)   )      
    end  

    # if ws.num_rows<=133

    #   Mail.defaults do
    #       delivery_method :smtp, { :address   => "smtp.sendgrid.net",
    #                        :port      => 587,
    #                        :domain    => "bridgeofsighsball.com",
    #                        :user_name => "tickets@bridgeofsighsball.com",
    #                        :password  => "bosb4",
    #                        :authentication => 'plain',
    #                        :enable_starttls_auto => true }
    #       end

    #   mail = Mail.deliver do
    #     to ticket['email']
    #     from 'Bridge of Sighs Ball <tickets@bridgeofsighsball.co.uk>'
    #     subject 'Ticket Sales'
    #     text_part do
    #       body 'HI'
    #     end
    #     html_part do
    #       content_type 'text/html; charset=UTF-8'
    #       body '<b>Hello world in HTML</b>'
    #     end
  

  erb :thankyou
end


	