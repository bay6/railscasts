Booking.Router.map (match)->
  @route 'books', path: '/'

Booking.BooksRoute = Ember.Route.extend
  model: -> Booking.Book.find()
