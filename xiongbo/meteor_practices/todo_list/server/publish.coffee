Lists = new Meteor.Collection("lists")

Meteor.publish 'lists', -> Lists.find() 
