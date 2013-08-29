Raffler.Router.map ->
  @route 'entries', path: '/'

Raffler.EntriesRoute = Ember.Route.extend
  #setupController: (controller) -> controller.set('content', Raffle.Entry.find())
  model: -> Raffler.Entry.find()
