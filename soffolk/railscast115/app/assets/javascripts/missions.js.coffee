# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Mission = {
  edit_click_callback: ->
    $(".editor-toolbar .preview").removeClass("active")
    $(".new-comment #preview").addClass("hidden")

    $(".new-comment #comment_content").css("display", "block")
    $(".editor-toolbar .edit").addClass("active")
    false

  preview_click_callback: ->
    $(".editor-toolbar .edit").removeClass("active")
    $(".editor-toolbar .preview").addClass("active")

    $(".new_comment #comment_content").css("display", "none")
    $(".new_comment #preview").removeClass("hidden")

    $(".new_comment #preview").html('Loading...')

    post_data = $(".new-comment form.new_comment").serialize()
    url = $(".editor-toolbar .preview").find("a").attr('href')

    $.ajax
      url: url
      data: post_data
      type: "post"
      dataType: "html"
      success: (data) ->
        $(".new-comment #preview").html(data)

    false
}

$ ->

  $(".editor-toolbar .edit").click ->
    Mission.edit_click_callback()

  $(".editor-toolbar .preview").click ->
    Mission.preview_click_callback()
