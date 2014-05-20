require 'sinatra'
require 'pony'
#require 'mongoid'
require 'json'
require 'rubygems'
require 'google_drive'

require './person'
#if settings.environment == :production
  # if we're on heroku, use the sendgrid settings
#  require './production_pony_options'
#else
  # otherwise, use our normal email account
#  require './development_pony_options'
#end

# Setup database connection
#Mongoid.load!("mongoid.yml")

get '/'  do
  erb :index
end

# get '/homepage' do
# 	erb:homepage
# end

# get '/sponsorship' do
# 	erb:sponsorship
# end

# get '/the_ball' do
# 	erb:the_ball
# end

# get '/index' do
# 	erb:index
# end

# get '/tickets' do
# 	erb:tickets
# end

# get '/contact' do
# 	erb:contact
# end

# get '/table_plan' do
# 	erb:table_plan
# end

# get '/ticket_form' do
#   erb:ticket_form
# end


# post '/table_plan' do

#   diner=Person.new(:name => params[:name], :table => params[:table])

# 	@a=diner.name
# 	@b=diner.table

#   erb:table_plan
# end

# if settings.environment == :production
#   # if we're on heroku, use the sendgrid settings
#   require './production_pony_options'
# else
#   # otherwise, use our normal email account
#   require './development_pony_options'
# end

# post '/ticket_form' do

#   ticket = {'name' => params[:name], 'email' => params[:email], 'college' => params[:college], 'tickets' => params[:tickets], 'status' => params[:status], 'age' => params[:age], 'ref_num' => rand(1000000)}
#   puts ticket
#     if ticket['tickets']='1' 
#       @ticket_text= 'a ticket'
#       @cost= "130"
#     else 
#       @ticket_text= 'two tickets'
#       @cost="260"
#     end
#   puts @ticket_text
#     @name= ticket['name'].split.first.capitalize
#     @reference = ticket['ref_num'].to_s

#     # Logs in.
#     # You can also use OAuth. See document of
#     # GoogleDrive.login_with_oauth for details.
#     session = GoogleDrive.login("james.jurkiewicz12@gmail.com", "jPkZPfU1")

#     # First worksheet of
#     # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
#     ws = session.spreadsheet_by_key("0AtqrFUvZahtHdDZtU2ZPb2JLM1FWT2xEMXMwWmxtWlE").worksheets[0]

#     # Dumps all cells.
#     for row in ws.num_rows+1..ws.num_rows+1
#       for col in 1..ws.num_cols
#        ws[row, 1]= ticket["name"]
#       ws[row, 2]= ticket["email"]
#        ws[row, 3]= ticket["college"]
#        ws[row, 4]= ticket["tickets"]
#        ws[row, 5]= ticket["status"]
#        ws[row, 6]= ticket["age"]
#        ws[row, 7]= ticket["ref_num"]
#       end
#     end
#     ws.save

#     if ws.num_rows<=133
    
#       Pony.mail( :to => ticket['email'],
#             :bcc => "administrator@bridgeofsighsball.co.uk",
#             :subject => "Bridge of Sighs confirmation email",
#             :body => erb(:email, :layout => false)   )
#     else
#       Pony.mail( :to => ticket['email'],
#             :bcc => "administrator@bridgeofsighsball.co.uk",
#             :subject => "Bridge of Sighs confirmation email",
#             :body => erb(:email_reserve, :layout => false)   )      
#     end  

#   erb :thankyou
# end


	