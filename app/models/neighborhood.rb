class Neighborhood < ActiveRecord::Base
  belongs_to :form

  attr_reader :name, :studio_price, :one_bed_price, :two_bed_price
  
end
