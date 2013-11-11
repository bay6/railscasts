$(function() {
  $('.edit_task input[type=submit]').remove();
  $('.edit_task input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
});
