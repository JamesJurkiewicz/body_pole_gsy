require 'mongoid'
require 'csv'

class Person
  include Mongoid::Document

  field :name,  type: String
  field :table, type: String
 
end
 