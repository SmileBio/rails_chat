class UsersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "users_welcome"
    #stream_for "welcome"#, TestJob.perform_later()
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def users_list
    users = User.all.map{|user| { id: user.id, email: user.email, online: user.is_online? }}
    ActionCable.server.broadcast "users_welcome", users
  end


end
