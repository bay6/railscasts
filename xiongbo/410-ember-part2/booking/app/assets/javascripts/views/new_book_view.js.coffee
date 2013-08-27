Booking.NewBookView = Ember.View.extend
  templateName: 'new_book'
  tagName: 'form'

  submit: ->
    @get('controller').send('addBook', @get('newBookName'))
    false
