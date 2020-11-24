#, This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mission.destroy_all
User.destroy_all

user1 = User.create!(fullname: "bob", city: "city", description: "ook", email: "mail@volunteers.com", password: "password")

puts "created #{User.count} users"


mission1 = Mission.create!(title: "ramasser déchets sur la plage", location: "plage des catalans", description: "on ramasse les déchets pour la planète", user: user1)
mission2 = Mission.create!(title: "nourrir les sdf", location: "marseille", description: "on leur donne la soupe", user: user1)


puts "created #{Mission.count} missions"

