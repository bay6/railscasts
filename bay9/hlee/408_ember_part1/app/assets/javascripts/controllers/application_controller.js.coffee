Raffler.ApplicationController = Ember.Controller.extend
  entries: []

  addEntry: -> 
    alert @get('newEntryName')
    @entries.pushObject name: @get('newEntryName')
    @set('newEntryName', "")
