class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.all.map{|user| {id: user.id, email: user.email, online: user.is_online?}}
    ActionCable.server.broadcast "welcome", users
  end


end
