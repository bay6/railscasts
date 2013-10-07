jQuery ->
  $('.edit_task input[type=checkbox]').click ->
    $(this).parent('form').submit()
