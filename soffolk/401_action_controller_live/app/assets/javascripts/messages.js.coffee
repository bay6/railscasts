# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

evt = new EventSource("/messages/events")
evt.addEventListener 'message', (e) ->
  #alert "hello"
  message = $.parseJSON(e.data).message
  $('#chat').append($("<li>").text("#{message.name}: #{message.content}"))
