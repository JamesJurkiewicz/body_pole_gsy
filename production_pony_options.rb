Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'bridgeofsighsball.co.uk',
    :user_name => 'tickets@bridgeofsighsball.co.uk',
    :password => 'bosb4',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

