Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['JJurkiewicz'],
    :password => ENV['JboSelect1'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}