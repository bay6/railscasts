Players = new Meteor.Collection("players")

if (Meteor.isClient)
  Template.player.events
    'click': ->
      Session.set("selected_player", this._id)

  Template.player.selected = ->
    if Session.equals("selected_player", this._id) then "selected" else ''

  Template.leaderboard.players = ->
    Players.find({}, {sort: {score: -1, name: -1}})

  Template.leaderboard.selected_name = ->
    player = Players.findOne(Session.get("selected_player"))
    player && player.name

  Template.leaderboard.events
    'click input.inc': ->
      Players.update(Session.get("selected_player"), {$inc: {score: 5}})

if (Meteor.isServer)
  Meteor.startup ->
    if (Players.find().count() == 0)
      names = ["xiongbo", "laowu", "rentao", "jianagbo", "renwei", "duna"]
      for name, i in names
        Players.insert({name: names[i], score: Math.floor(Random.fraction()*10)*5})
