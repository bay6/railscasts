Raffler.NewEntryView = Ember.View.extend
  templateName: 'new_entry'
  tagName: 'form'

  submit: ->
    @get('controller').send('addEntry', @get('newEntryName'))
    @set('newEntryName', "")
    false
