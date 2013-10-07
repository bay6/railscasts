$(document).on 'click', '.edit_task input[type=checkbox]', ->
  $(this).parent('form').submit()

