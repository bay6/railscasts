Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: (name) ->
    Raffler.Entry.createRecord(name: name)
    @get('store').commit()
    #@pushObject Ember.Object.create(name: @get('newEntryName'))
    #Raffler.Entry.createRecord(name: @get('newEntryName'))
    #@set('newEntryName', "")

  drawWinner: ->
    @setEach('highlight', false)
    pool = @rejectProperty('winner')
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set('winner', true)
      entry.set('highlight', true)
      @get('store').commit()

  allWinner: (->
    @everyProperty('winner') 
  ).property('@each.winner')
