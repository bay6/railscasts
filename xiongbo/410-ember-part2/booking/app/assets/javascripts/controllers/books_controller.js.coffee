Booking.BooksController = Ember.ArrayController.extend
  addBook: ->
    Booking.Book.createRecord name: @get('newBookName')
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
