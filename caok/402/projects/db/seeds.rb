# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p = Project.create! name: "Yardwork"
p.tasks.create! name: "Mow the lawn", complete: 1
p.tasks.create! name: "Paint the fence"
p.tasks.create! name: "Rake the leaves"

p = Project.create! name: "Housework"
p.tasks.create! name: "Pick up bedroom"
p.tasks.create! name: "Mop kitchen"
