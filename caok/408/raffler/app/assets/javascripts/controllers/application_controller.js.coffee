Raffler.ApplicationController = Ember.Controller.extend
  addEntry: ->
    alert @get('newEntryName')
    @set('newEntryName', "")
