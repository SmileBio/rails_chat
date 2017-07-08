class UsersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "users"
    #stream_for "welcome"#, TestJob.perform_later()
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def users_list
    TestJob.perform_later()
  end


end
