
require 'mongoid'
require 'csv'

class Booked_clients

  include Mongoid::Document

  field :name,  type: String
  field :email, type: String
  field :class, type: String
  field :phone, type: String
  field :disclaimer, type: String
  field :terms, type: String
  field :amount, type: String
 
end

=begin

@dancer=Booked_clients.new(:name => name, :email => email, :class => classes, :phone => phone, :disclaimer => disclaimer, :terms => terms, :amount => amount)


require 'mongoid'
require 'csv'

class Booked_clients
  include Mongoid::Document

  field :name,  type: String
  field :table, type: String
 
end
 
     @diner=Booked_clients.new(:name => name, :table => table_number)=end
