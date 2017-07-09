$(document).on 'turbolinks:load', ->
  welcome = $('#welcome_page')
  if welcome.data("welcome-id")
    App.users = App.cable.subscriptions.create {channel: "UsersChannel", room: "welcome"},
      connected: ->

        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        data.forEach (item)->
          $( "##{item.id}" ).html("#{item.online}")


        # Called when there's incoming data on the websocket for this channel

      users_list: (data) ->
        @perform "users_list"

      test: () ->
        @perform "test"


