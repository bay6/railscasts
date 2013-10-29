# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#$(document).ready ->
  #$(".edit_task input[type=checkbox]").click ->
    #alert "clicked"
$ -> 
  $('.edit_task').submitOnCheck()


jQuery.fn.submitOnCheck = ->
  @find("input[type=submit]").remove()
  @find("input[type=checkbox]").click ->
    $(this).parent("form").submit()
  this

#$ ->
  #$(".edit_task input[type=submit]").remove()
  #$(".edit_task input[type=checkbox]").click ->
    #$(this).parent("form").submit()    
