# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create do |e|
  e.name = "Rocking the Daisies"
  e.about = "This event rocks!"
  e.start_date = Date.parse("September 2, 2014")
  e.end_date = Date.parse("September 5, 2014")
end