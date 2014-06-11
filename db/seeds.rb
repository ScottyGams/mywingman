# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times { Fabricate(:user) }

['Arsenal', 'Yankees', 'Mets', 'Cookies', 'Muffins', 'Bacon', 'Beards', 'Glasses', 'Yogurt', 'Star Wars', 'Indiana Jones', 'Back to the Future', 'Apple', 'Samsung', 'Blue', 'Fan', '...', 'Television', 'Pavling', 'Box', 'Toilet', 'Boots', 'Juice', 'Fire Exit', 'Yellow', 'Red'].each { |interest| Interest.create!(name: interest) }

User.all.each do |user|
  interests = Interest.all
  user.interests = interests.sample(5)
  user.save
end