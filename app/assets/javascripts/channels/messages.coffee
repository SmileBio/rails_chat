$(document).on 'turbolinks:load', ->
  room = $('#room')
App.messages = App.cable.subscriptions.create {channel: "MessagesChannel"},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log "message"
    $("#room_#{data.room_id}").append(
        "<p>#{data.context}</p>"
      )
    length = $("#room_#{data.room_id} p").length
    if  length > 10
      $("#room_#{data.room_id} p").each (index, item)->
        if index < length-11
          $(item).remove()
    # Called when there's incoming data on the websocket for this channel
  send_message: (data)->
    @perform "send_message", data
