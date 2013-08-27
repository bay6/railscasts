Raffler.Router.map (match)->
  # match('/').to('index')
  @route 'entries', path: '/'

Raffler.EntriesRoute = Ember.Route.extend
  #setupController: (controller) -> controller.set('controller', [])
  model: -> Raffler.Entry.find()

