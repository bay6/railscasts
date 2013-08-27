Booking.BooksController = Ember.ArrayController.extend
  addBook: ->
    @pushObject Ember.Object.create name: @get('newBookName')
    @set('newBookName', "")
    
  booking: ->
    @setEach('highlight', false)
    pool = @rejectProperty('booked')
    if pool.length > 0
      book = pool[Math.floor(Math.random()*pool.length)]
      book.set('booked', true)
      book.set('highlight', true)
