p = Project.create! name: "Learn Rails"
p.tasks.create! name: "Learn Ruby"
p.tasks.create! name: "Learn HTML"
p.tasks.create! name: "Learn CSS (and Sass)"
p.tasks.create! name: "Learn JavaScript (and CoffeeScript)"
p.tasks.create! name: "Learn SQL and relational databases"
p.tasks.create! name: "Learn HTTP and request/response process"

p = Project.create! name: "Learn Karate"
p.tasks.create! name: "Find Mr. Miyagi"
p.tasks.create! name: "Paint the fence"
p.tasks.create! name: "Wax the car"
p.tasks.create! name: "Sand the deck"

p = Project.create! name: "Count down from 100"
100.downto(1) do |num|
  p.tasks.create! name: "Say #{num}"
end

p = Project.create! name: "Count down from 1,000"
1000.downto(1) do |num|
  p.tasks.create! name: "Say #{num}"
end

