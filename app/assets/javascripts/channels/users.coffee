App.users = App.cable.subscriptions.create {channel: "UsersChannel", room: "welcome"},
  connected: ->

    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    result = ""
    console.log(data)
    data.map (user, index) ->
      return result += "<p>#{user.email}, online=#{user.online}</p>"
    $("#users").html(result)
    # Called when there's incoming data on the websocket for this channel

  users_list: (data) ->
    @perform "users_list"

  logout: () ->
    @perform "logout"
