# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

150.times { Fabricate(:user) }

['New York Yankees', 'NERVO', 'NERO', 'Razer', 'Mercedes-Benz USA', 'American Express', 'Stella Artois', 'New York University', 'The Onion', 'The Stig', 'IGN.com', 'Nestlé', 'Nike', 'Shock Top', 'Bulova', 'Absolut', 'Ultra Music Festival', 'deadmau5', 'Muse', 'New York Yankees', 'Chelsea FC', 'New York Mets', 'Cookies', 'Muffins', 'Bacon', 'Beards', 'Shakira', 'Yogurt', 'Star Wars', 'Indiana Jones', 'Back to the Future', 'Apple', 'Samsung', 'Electric Daisy Carnival', 'Fan', 'London', 'Sensation', 'London, United Kingdom', 'Breaking Bad', 'Batman: The Animated Series', 'General Assembly', 'moo.com', 'Cyanide & Happiness', 'The Walking Dead', 'Engadget', 'Eminem', 'Cristiano Ronaldo', 'YouTube', 'Vin Diesel', 'Michael Jackson', 'The Simpsons', 'Texas Holdem Poker', 'FC Barcelona', 'Real Madrid CF', 'Linkin Park', 'Mr. Bean', 'Family Guy', 'Pitbull', 'Titanic', 'South Park', 'MTV', 'Manchester United FC', 'Disney', 'Red Bull', 'PlayStation', 'Starbucks Coffee', 'Oreo', 'Pepsi'].each { |interest| Interest.create!(name: interest) }

User.all.each do |user|
  interests = Interest.all
  user.interests = interests.sample(rand(10)+7)
  user.save
end