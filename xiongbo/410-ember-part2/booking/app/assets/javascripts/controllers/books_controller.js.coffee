Booking.BooksController = Ember.ArrayController.extend
  addBook: (name)->
    Booking.Book.createRecord name: name
    @get('store').commit()
    @set('newBookName', "")
    
  booking: ->
    @setEach('highlight', false)
    pool = @rejectProperty('booked')
    if pool.length > 0
      book = pool[Math.floor(Math.random()*pool.length)]
      book.set('booked', true)
      book.set('highlight', true)
      @get('store').commit()

  allBooked: (->
    @everyProperty('booked')
  ).property('@each.booked')
