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
      {name:"Angela", photo_url:"angela.jpg", bio: "Angela lives in the Adams Morgan neighborhood. \"I recently moved from Philadelphia, so having an app that gave me some insight into DCs living costs was helpful.  Where Wallet was quick and very easy to use.\""},
      {name:"Faz", photo_url:"faz.png", bio:"Faz lives in the Dupont Circle neighborhood.  \"Thanks to Where Wallet, I found an apartment in a neighborhood that fits me perfectly!\""},
      {name:"John", photo_url:"john.jpg", bio:"John lives in the Petworth neighborhood.  \"Where Wallet makes finding an apartment effortless! All I have to do is call the movers!\""},
      {name:"Raul", photo_url:"raul.jpg", bio:"Raul lives in the Noma neighborhood.  \"Before, finding information about a neighborhood was tedious and time consuming.  Now, no gimicks.  No tricks.  Just Where Wallet.\""},
      {name:"Kim", photo_url:"kim.jpg", bio:"Kim lives in the Takoma neighborhood.  \"This app takes all the financial information I care about, and makes it easy to understand.\""},
      {name:"Seema", photo_url:"seema.jpg", bio:"Seema lives in the Logan Circle neighborhood.  \"I thought relocating from a different city would be stressful, but Where Wallet made the process significantly more pleasant.\""},
      {name:"Dave", photo_url:"dave.jpg", bio:"Dave lives in the Friendship Heights neighborhood.  \"Easy and fun.  Whether you're a DC native or a newcomer to the area, if you're looking to relocate, Where Wallet makes finding a place to live straightforward.\""},
      {name:"Melanie", photo_url:"melanie.jpg", bio:"Mel lives in the Benning Heights neighborhood.  \"In a transient city like DC, finding a place to live can be tricky.  Where Wallet is the perfect tool for those looking to make a change.\""}
      ])
