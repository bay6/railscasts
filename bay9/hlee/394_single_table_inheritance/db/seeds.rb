# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create! username: "rbates", email: "ryan@example.com", password: "secret"

u.tasks.create! name: "Meet Mr. Miyagi", complete: true
u.tasks.create! name: "Paint the fence", complete: true
u.tasks.create! name: "Wax the car"
u.tasks.create! name: "Sand the deck"
