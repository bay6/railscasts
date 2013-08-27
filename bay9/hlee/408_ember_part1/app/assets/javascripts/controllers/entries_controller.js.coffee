Raffler.EntriesController = Ember.Controller.extend
#  entries: []

#  addEntry: -> 
#    @entries.pushObject name: @get('newEntryName')
#    @set('newEntryName', "")
  addEntry: -> 
    @pushObject name: @get('newEntryName')
    @set('newEntryName', "")

  drawWinner: ->
    pool = @rejectProperty('winner')
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.winner = true
