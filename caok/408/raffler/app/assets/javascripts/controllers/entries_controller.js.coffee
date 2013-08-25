Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: ->
    @pushObject name: @get('newEntryName')
    @set('newEntryName', "")
