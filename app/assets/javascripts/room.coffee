# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

send_message = (event)->
  event.preventDefault()

  if file = $("#upload_file").prop('files')[0]
    getBase64(file)
  else
    data = {}
    data.room_id = $("#room_id").val()
    data.user_id = $("#user_id").val()
    data.context = $("#context").val()
    App.messages.send_message(data)
    $("#context").val("")
  return false

getBase64 = (file) ->
   reader = new FileReader();
   reader.readAsDataURL(file);
   reader.onload = () ->
    console.log "final"
    filename = $("#upload_file").val()
    data = {}
    data.filename = filename.split('.').pop() || "nil"
    data.file = reader.result
    data.room_id = $("#room_id").val()
    data.user_id = $("#user_id").val()
    data.context = $("#context").val()
    App.messages.send_message(data)
    $("#context").val("")
    $("#upload_file").val("")
   reader.onerror = (error) ->
     console.log('Error: ', error)



$(document).on "turbolinks:load", ()->
  $("#send_message").on("click", send_message)


