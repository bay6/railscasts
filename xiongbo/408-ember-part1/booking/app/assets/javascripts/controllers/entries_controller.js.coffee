Booking.EntriesController = Ember.ArrayController.extend
  addEntry: ->
    @pushObject Ember.Object.create name: @get('newEntryName')
    @set('newEntryName', "")
    
  booking: ->
    @setEach('highlight', false)
    pool = @rejectProperty('booked')
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set('booked', true)
      entry.set('highlight', true)
