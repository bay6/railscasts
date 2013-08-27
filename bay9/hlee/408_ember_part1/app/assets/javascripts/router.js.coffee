#Raffler.Router.map (match)->
  # match('/').to('index')
Raffler.Router.map ->
  @route 'entries', path: '/'

Raffler.EntriesRoute = Ember.Route.extend
  setupController: (controller) -> controller.set('content', [])
