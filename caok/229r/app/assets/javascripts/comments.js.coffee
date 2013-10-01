@CommentPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    $.get($('#comments').data('url'), after: $('.comment').last().data('id'))

jQuery ->
  if $('#comments').length > 0
    CommentPoller.poll()
