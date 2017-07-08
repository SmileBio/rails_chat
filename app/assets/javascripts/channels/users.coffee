App.users = App.cable.subscriptions.create {channel: "UsersChannel"},
  connected: ->

    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    result = ""
    console.log(data)
    data.forEach (user, index) ->
      # return result += "<p>#{user.email}<span><input type='checkbox' checked=#{user.online}></span></p>
      # <form action='/rooms' accept-charset='UTF-8' method='post'>
      # <input type='hidden' name='user_id' id='user_id' value=#{user.id}>
      # <span><input type='submit' name='commit' value='начать чат'' class='btn btn-danger' data-disable-with='начать чат''></span>
      # </form>
      # "
      #user.online ? $("##{user.id}").prop("checked") : false
      #$("##{}")

    # $("#users").html(result)
    # Called when there's incoming data on the websocket for this channel

  users_list: (data) ->
    @perform "users_list"

  test: () ->
    @perform "test"


