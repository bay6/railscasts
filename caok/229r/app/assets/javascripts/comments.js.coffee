@CommentPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    $.get($('#comments').data('url'), after: $('.comment').last().data('id'))

  addComments: (comments) ->
    if comments.length > 0
      $('#comments').append($(comments).hide())
      $('#show_comments').show()
    @poll()

  showComments: (e) ->
    e.preventDefault()
    $('.comment').show()
    $('#show_comments').hide()

jQuery ->
  if $('#comments').length > 0
    CommentPoller.poll()
    $('#show_comments a').click CommentPoller.showComments
