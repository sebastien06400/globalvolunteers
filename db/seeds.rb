#, This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

Mission.destroy_all
User.destroy_all
Participation.destroy_all

user1 = User.create!(fullname: "bob", city: "city", description: "ook", email: "test@volunteers.com", password: "password")

puts "created #{User.count} users"


mission1 = Mission.create!(title: "ramassage de déchets sur la plage", location: "Plage de Nice", description: "A l'occasion de la journee mondiale de l'environnement, nous organisons une collecte de déchets a la plage de Nice et nous cherchons plusieurs benevoles. Rendez-vous a 10h a la plage de Nice. ", user: user1, quota: 25, start_time: DateTime.new(2020,12,11,10,0,0), end_time: DateTime.new(2020,12,11,14,0,0))
mission2 = Mission.create!(title: "distribution de repas pour les sans-abris", location: "Place Jean-Medecin", description: "Nous organisons une distribution de repas pour les sans-abris et nous avons beoin de benevoles pour nous aider dans la logistique.", user: user1, quota: 25, start_time: DateTime.new(2020,12,15,17,30,0), end_time: DateTime.new(2020,12,15,19,30,0))


puts "created #{Mission.count} missions"

