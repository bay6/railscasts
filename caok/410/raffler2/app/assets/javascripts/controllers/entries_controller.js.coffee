Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: (name) ->
    Raffler.Entry.createRecord(name: name)
    @get('store').commit()

  drawWinner: ->
    @setEach('highlight', false)
    pool = @rejectProperty('winner')
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set('winner', true)
      entry.set('highlight', true)
      @get('store').commit()

  allWinners: (->
    @everyProperty('winner')
  ).property('@each.winner')
