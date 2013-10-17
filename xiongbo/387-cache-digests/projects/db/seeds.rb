p = Project.create! name: "Yardwork"
p.tasks.create! name: "Mow the lawn", completed_at: Time.zone.now
p.tasks.create! name: "Paint the fence"
p.tasks.create! name: "Rake the leaves"

p = Project.create! name: "Housework"
p.tasks.create! name: "Pick up bedroom"
p.tasks.create! name: "Mop kitchen"
