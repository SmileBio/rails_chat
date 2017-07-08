# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

send_message = (event)->
  event.preventDefault()
  data = {}
  data.room_id = $("#room_id").val()
  data.user_id = $("#user_id").val()
  data.context = $("#context").val()
  App.messages.send_message(data)
  $("#context").val("")
  return false


$(document).on "turbolinks:load", ()->
  $("#send_message").on("click", send_message)
