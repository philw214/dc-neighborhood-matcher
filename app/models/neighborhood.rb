class Neighborhood < ActiveRecord::Base
  belongs_to :form

  attr_reader :name
  
end
