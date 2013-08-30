Raffler.Router.map (match)->
  @route 'entries', path: '/'

Raffler.EntriesRoute = Ember.Route.extend
  setupController: (controller) -> controller.set('content', [])
