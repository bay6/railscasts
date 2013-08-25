Booking.Router.map (match)->
  @route 'entries', path: '/'

Booking.EntriesRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', [])

