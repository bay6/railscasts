Booking.Router.map (match)->
  @route 'books', path: '/'

Booking.BooksRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', [])

