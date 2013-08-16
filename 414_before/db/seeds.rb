# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Task.create! name: "Learn Rails", complete: true
Task.create! name: "Paint the fence", complete: false
Task.create! name: "Wax the cars", complete: false
Task.create! name: "Sand the deck", complete: false
Task.create! name: "Play Piano", complete: false
Task.create! name: "Mow the lawn", complete: false
Task.create! name: "Vacuum house", complete: false
