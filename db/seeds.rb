# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"
Profile.destroy_all

csv_text = File.read('Neighborhood_Zri_AllHomes.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Neighborhood.create!(row.to_hash)
    end


    Profile.create([
      {name:"Angela", bio:"Angela lives in the Adams Morgan neighborhood. She makes $51,000 a year."},
      {name:"Michael", bio:"Michael lives in the Anacostia neighborhood.  He make $27,000 a year."},
      {name:"John", bio:"John lives in the Petworth neighborhood.  He makes $38,000 a year."},
      {name:"Jorge", bio:"Jorge lives in the Noma neighborhood.  He makes $61,000 a year."},
      {name:"Kim", bio:"Kim lives in the Takoma neighborhood.  She makes $49,000 a year."},
      {name:"Rosa", bio:"Rosa lives in the Brentwood neighborhood.  She makes $52,000 a year."},
      {name:"Dave", bio:"Dave lives in the Friendship Heights neighborhood.  He makes $36,000 a year."},
      {name:"Mel", bio:" lives in the Benning Heights neighborhood.  She makes $29,000a year."}
      ])
