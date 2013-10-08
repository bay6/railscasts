jQuery ->
  $('document').on 'click', '.edit_task input[type=checkbox]', ->
      $(this).parent('form').submit()
  #$('.edit_task input[type=checkbox]').click ->
    #$(this).parent('form').submit()


$(document).ready(ready)
$(document).on('page:load', ready)
