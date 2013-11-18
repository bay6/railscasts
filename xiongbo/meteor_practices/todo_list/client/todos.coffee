Lists = new Meteor.Collection("lists")
Todos = new Meteor.Collection("todos")

Session.setDefault('list_id', null)
Session.setDefault('tag_filter', null)
Session.setDefault('editing_addtag', null)
Session.setDefault('editing_listname', null)
Session.setDefault('editing_itemname', null)

listHandle = Meteor.subsrcibe "list", ->
  unless Session.get("list_id")
    list = Lists.findOne({}, {sort: {name: 1}})
    if list
      Router.setList(list._id)

okCancelEvents = (selector, callbacks) ->
  ok = callbacks.ok || ->
  cancel = callbacks.cancel || ->

  events = {}
  events["keyup #{selector}, keydown #{selector}, focusout #{selector}"] = ->
   console.log("temp") 
