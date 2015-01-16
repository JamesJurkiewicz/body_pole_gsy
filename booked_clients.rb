require 'mongoid'
require 'csv'

class Booked_clients

  include Mongoid::Document

  field :name,  type: String
  field :email, type: String
  field :classes, type: String
  field :phone, type: String
  field :disclaimer, type: String
  field :terms, type: String
 
end
 