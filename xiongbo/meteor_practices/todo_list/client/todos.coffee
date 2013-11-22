Lists = new Meteor.Collection("lists")
Todos = new Meteor.Collection("todos")

Session.setDefault('list_id', null)
Session.setDefault('tag_filter', null)
Session.setDefault('editing_addtag', null)
Session.setDefault('editing_listname', null)
Session.setDefault('editing_itemname', null)

# set routes
TodosRouter = Backbone.Router.extend
  routes: {"list_id": "main"}
  main: (list_id) ->
    oldList = Session.get("list_id")
    if oldList != list_id
      Session.set("list_id", list_id)
      Session.set("tag_filter", null)

Router = new TodosRouter

listsHandle = Meteor.subscribe "list", ->
  unless Session.get("list_id")
    list = Lists.findOne({}, {sort: {name: 1}})
    if list
      Router.setList(list._id)

okCancelEvents = (selector, callbacks) ->
  ok = callbacks.ok || ->
  cancel = callbacks.cancel || ->

  events = {}
  events["keyup #{selector}, keydown #{selector}, focusout #{selector}"] = (event)->
    if event.type == "keydown" and event.which == 27
      #escape
      cancel.call(this, event)
    else if (event.type == "keyup" && event.which == 13 || event.type == "focus")
      value = event.target.value || ""
      if value
        ok.call(this, value, event)
      else
        cancel.call(this, event)
  events


# Lists's event

Template.lists.loading = ->
  not listsHandle.ready()

Template.lists.lists = ->
  Lists.find({}, {sort: {name: 1}})

